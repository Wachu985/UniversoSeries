import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/presentation/views/favorites_view.dart';
import 'package:multi_player/presentation/views/home_view.dart';
import 'package:multi_player/presentation/views/media_view.dart';
import 'package:multi_player/presentation/widgets/custom_bottom_navigation.dart';

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
          0 => const Text("Ultimas Series"),
          1 => const Text("Catalogo"),
          2 => const Text("Favoritos"),
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
