import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/src/presentation/widgets/shared/custom_sliver_appbar.dart';

import '../../../../generated/l10n.dart';

class DescriptionScreen extends StatelessWidget {
  static const String screenName = "DescriptionScreen";
  const DescriptionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MediaDetails(),
                childCount: 1),
          )
        ],
      ),
    );
  }
}

class _MediaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serieSelected = context.watch<MediaBloc>().state.serieSelected;
    final Size size = MediaQuery.of(context).size;
    final textTraslate = S.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (serieSelected != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Imagen
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: serieSelected.poster,
                    width: size.width * 0.3,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Image.asset(
                            'assets/bottle-loader.gif',
                            fit: BoxFit.cover),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),

                const SizedBox(width: 10),
                // * Descripcion
                SizedBox(
                  width: (size.width - 40) * 0.7,
                  child: Column(
                    children: [
                      Text(serieSelected.name,
                          style: textTheme.titleLarge?.copyWith(fontSize: 30)),
                      Text(
                        serieSelected.description,
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // * Mostrar los Actores

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/home/0/detail/temporada/'),
                style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
                child: Text(
                  textTraslate.descriptionSeeSeasons,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
