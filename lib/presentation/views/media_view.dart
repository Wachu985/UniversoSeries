import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/presentation/widgets/shared/error_custom_widget.dart';
import 'package:multi_player/presentation/widgets/tile_widget.dart';

class MediaView extends StatelessWidget {
  const MediaView({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    if (state.mediaStatus == MediaStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.mediaStatus == MediaStatus.success) {
      return state.series.isEmpty
          ? const ErrorCustomWidget(text: "No existen series en el servidor")
          : MasonryGridView.count(
              itemCount: state.series.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                final serie = state.series[index];
                return FutureBuilder<bool>(
                    future: context.read<MediaBloc>().checkFavorite(serie.id),
                    builder: (context, snapshot) {
                      return FadeIn(
                        child: Tile(
                          urlImage: serie.poster,
                          name: serie.name,
                          populate: serie.populate,
                          iconPress: () => context
                              .read<MediaBloc>()
                              .add(MediaEvent.toogleFavorite(media: serie)),
                          isFavorite: snapshot.data ?? false,
                          onTap: () {
                            context
                                .read<MediaBloc>()
                                .add(SelectSerie(serie: serie));
                            context.go('/home/1/detail/');
                          },
                          index: index,
                          extent: index % 2 == 0 ? 300 : 250,
                        ),
                      );
                    });
              },
            );
    } else {
      return const ErrorCustomWidget(
        text: "Hubo un error al conectarse al servidor",
      );
    }
  }
}
