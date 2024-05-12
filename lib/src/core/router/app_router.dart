import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:multi_player/src/presentation/screens/auth/signin_screen.dart';
import 'package:multi_player/src/presentation/screens/auth/signup_screen.dart';
import 'package:multi_player/src/presentation/screens/media/caps_screen.dart';
import 'package:multi_player/src/presentation/screens/media/description_screen.dart';
import 'package:multi_player/src/presentation/screens/media/home_screen.dart';
import 'package:multi_player/src/presentation/screens/media/temporadas_screen.dart';
import 'package:multi_player/src/presentation/screens/media/video_player_screen.dart';
import 'package:multi_player/src/presentation/screens/settings/settings_screen.dart';

// Custom Transition Page
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        CupertinoPageTransition(
      linearTransition: true,
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      child: child,
    ),
  );
}

final appRouter = GoRouter(
  initialLocation: "/home/0",
  routes: [
    GoRoute(
      path: "/signIn",
      name: SigninScreen.screenName,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SigninScreen(),
      ),
    ),
    GoRoute(
      path: "/signUp",
      name: SignupScreen.screenName,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SignupScreen(),
      ),
    ),
    GoRoute(
      path: "/home/:page",
      name: HomeScreen.screenName,
      pageBuilder: (context, state) {
        int pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 2 || pageIndex < 0) pageIndex = 0;
        return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: HomeScreen(pageIndex: pageIndex),
        );
      },
      routes: [
        GoRoute(
          path: "detail",
          name: DescriptionScreen.screenName,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const DescriptionScreen(),
          ),
          routes: [
            GoRoute(
              path: "temporada",
              name: TemporadasScreen.screenName,
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const TemporadasScreen()),
              routes: [
                GoRoute(
                  path: "caps/:nameId",
                  name: CapsScreen.screenName,
                  pageBuilder: (context, state) {
                    final mediaId = state.pathParameters['nameId'] ?? 'no-id';
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: CapsScreen(mediaId: mediaId),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: "video/:uri",
                      name: VideoPlayerScreen.screenName,
                      pageBuilder: (context, state) {
                        final videoUri = state.pathParameters['uri'] ?? 'no-id';
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: VideoPlayerScreen(
                              videoUri: videoUri.replaceAll("*9", "/")
                              // .replaceAll(" ", "%20"),
                              ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'settings',
          name: SettingsScreen.screenName,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const SettingsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
  // redirect to the login page if the user is not logged in
  redirect: (BuildContext context, GoRouterState state) {
    // if the user is not logged in, they need to login
    final bool loggedIn = context.read<AuthBloc>().state.isLoged;
    final AuthStatus status = context.read<AuthBloc>().state.status;
    // final bool loggingIn = state.matchedLocation == '/signIn';

    if (state.fullPath == "/signUp") {
      return '/signUp';
    } else if (!loggedIn) {
      return '/signIn';
    } else if (status == AuthStatus.success) {
      return '/home/0';
    }
    return null;
  },
);
