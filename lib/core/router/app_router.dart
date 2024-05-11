import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/screens/media/caps_screen.dart';
import 'package:multi_player/presentation/screens/media/description_screen.dart';
import 'package:multi_player/presentation/screens/media/home_screen.dart';
import 'package:multi_player/presentation/screens/media/temporadas_screen.dart';
import 'package:multi_player/presentation/screens/media/video_player_screen.dart';
import 'package:multi_player/presentation/screens/settings/settings_screen.dart';

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
);
