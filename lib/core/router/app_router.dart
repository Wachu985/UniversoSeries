import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/screens/caps_screen.dart';
import 'package:multi_player/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/home/0",
  routes: [
    GoRoute(
      path: "/home/:page",
      name: HomeScreen.screenName,
      builder: (context, state) {
        int pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 2 || pageIndex < 0) pageIndex = 0;
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: "caps/:id",
          name: CapsScreen.screenName,
          builder: (context, state) {
            final mediaId = int.parse(state.pathParameters['id'] ?? 'no-id');
            return CapsScreen(mediaId: mediaId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
