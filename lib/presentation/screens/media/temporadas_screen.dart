import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/presentation/widgets/tile_widget.dart';

class TemporadasScreen extends StatelessWidget {
  static const String screenName = "TemporadaScreen";
  const TemporadasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temporadas"),
      ),
      body: MasonryGridView.count(
        itemCount: state.serieSelected?.temporadas.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final temporada = state.serieSelected?.temporadas[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: FadeInUp(
              from: 30,
              child: Tile(
                isMedia: false,
                urlImage: state.serieSelected?.poster ?? "",
                name: temporada?.name ?? "",
                onTap: () => context
                    .go('/home/0/detail/temporada/caps/${temporada?.name}'),
                index: index,
                extent: 300,
              ),
            ),
          );
        },
      ),
    );
  }
}
