import 'package:flutter/material.dart';
import 'package:multi_player/presentation/views/favorites_view.dart';
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
    pageController = PageController(keepPage: true);
    super.initState();
  }

  final List<Widget> viewRoutes = const [MediaView(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Video Player"),
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
    pageController.dispose();
    super.dispose();
  }
}
