import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/src/presentation/widgets/custom_bottom_navigation.dart';
import '../../../../generated/l10n.dart';
import '../../views/views.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "HomeScreen";
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(keepPage: true, initialPage: 0);
    super.initState();
  }

  final List<Widget> viewRoutes = const [
    HomeView(),
    MediaView(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    super.build(context);
    if (pageController.hasClients) {
      if (pageController.page != null) {
        pageController.animateToPage(
          widget.pageIndex,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 250),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: switch (widget.pageIndex) {
          0 => Text(textTraslate.homeText1),
          1 => Text(textTraslate.homeText2),
          2 => Text(textTraslate.homeText3),
          int() => throw UnimplementedError(),
        },
        actions: [
          IconButton(
            onPressed: () =>
                context.read<MediaBloc>().add(MediaEvent.fetchData()),
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () => context.go("/home/${widget.pageIndex}/settings"),
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: viewRoutes,
      ),
      bottomNavigationBar:
          CustomBottomNavigation(currentIndex: widget.pageIndex),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }
}
