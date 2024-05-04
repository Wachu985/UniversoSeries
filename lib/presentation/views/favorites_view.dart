import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/widgets/tile_widget.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return FadeInUp(
          from: 30,
          child: Tile(
            urlImage:
                "https://s.yimg.com/ny/api/res/1.2/hz3GrlM137FL8wJmZUFv9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTgwMA--/https://media.zenfs.com/en/comingsoon_net_477/918084f5537594a4254a064b10fc2d86",
            name: "Futurama",
            onTap: () => context.go('/home/1/caps/$index'),
            index: index,
            extent: index % 2 == 0 ? 300 : 200,
          ),
        );
      },
    );
  }
}
