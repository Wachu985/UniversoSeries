import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';

import '../../../generated/l10n.dart';
import '../widgets/widgets.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    context.read<MediaBloc>().add(MediaEvent.loadFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    final textTraslate = S.of(context);
    return state.favorites.isEmpty
        ? ErrorCustomWidget(text: textTraslate.favoritesViewText)
        : MasonryGridView.count(
            itemCount: state.favorites.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              final media = state.favorites[index];
              return FutureBuilder<bool>(
                  future: context.read<MediaBloc>().checkFavorite(media.id),
                  builder: (context, snapshot) {
                    return FadeInUp(
                      from: 30,
                      child: Tile(
                        urlImage: media.poster,
                        name: media.name,
                        populate: media.populate,
                        isFavorite: snapshot.data ?? false,
                        iconPress: () => context
                            .read<MediaBloc>()
                            .add(MediaEvent.toogleFavorite(media: media)),
                        onTap: () {
                          context
                              .read<MediaBloc>()
                              .add(SelectSerie(serie: media));
                          context.go('/home/2/detail/');
                        },
                        index: index,
                        extent: index % 2 == 0 ? 300 : 250,
                      ),
                    );
                  });
            },
          );
  }
}
