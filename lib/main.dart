import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:multi_player/core/environment/environment_config.dart';
import 'package:multi_player/core/router/app_router.dart';
import 'package:multi_player/core/shared_preferences/shared_preferences_singlenton.dart';
import 'package:multi_player/core/theme/app_theme.dart';
import 'package:multi_player/infrastructure/datasources/isar_local_storage_datasource.dart';
// import 'package:multi_player/infrastructure/datasources/media_dio_datasource.dart';
import 'package:multi_player/infrastructure/datasources/media_suprabase_datasource.dart';
import 'package:multi_player/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:multi_player/infrastructure/repositories/media_repository_impl.dart';
import 'package:multi_player/presentation/blocs/media/media_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/blocs/theme/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = SharedPreferencesSinglenton();
  await prefs.initPrefs();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: EnvironmentConfig.apiUrl,
    anonKey: EnvironmentConfig.apiKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => MediaBloc(
          localRepository: LocalStorageRepositoryImpl(
            datasource: IsarLocalStorageDatasource(),
          ),
          repository: MediaRepositoryImpl(
            datasource: MediaSuprabaseDatasource(),
          ),
        )
          ..add(MediaEvent.fetchData())
          ..add(MediaEvent.fetchLastMedia())
          ..add(
            MediaEvent.fetchPopulateMedia(),
          ),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => ThemeBloc()..add(ThemeEvent.loadTheme()),
        lazy: false,
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Builder(
          builder: (context) {
            return MaxWidthBox(
              maxWidth: 1200,
              background: Container(color: const Color(0xFFF5F5F5)),
              child: ResponsiveScaledBox(
                width: ResponsiveValue<double?>(
                  context,
                  conditionalValues: [
                    const Condition.equals(name: MOBILE, value: 450),
                    const Condition.between(start: 800, end: 1100, value: 800),
                    const Condition.between(start: 1000, end: 1200, value: 700),
                  ],
                ).value,
                child: child!,
              ),
            );
          },
        ),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(
        darkMode: context.select((ThemeBloc bloc) => bloc.state.darkMode),
        selectedColor:
            context.select((ThemeBloc bloc) => bloc.state.selectedColor),
      ).getTheme(),
    );
  }
}
