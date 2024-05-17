import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final serieSelected = context.watch<MediaBloc>().state.serieSelected;
    if (serieSelected != null) {
      return SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: size.height * 0.6,
        actions: [
          FutureBuilder<bool>(
              future: context.read<MediaBloc>().checkFavorite(serieSelected.id),
              builder: (context, isFavorite) {
                return IconButton(
                  onPressed: () => context
                      .read<MediaBloc>()
                      .add(MediaEvent.toogleFavorite(media: serieSelected)),
                  icon: Icon(
                    isFavorite.data ?? false
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isFavorite.data ?? false ? Colors.red : Colors.white,
                  ),
                );
              })
        ],
        foregroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Row(
            children: [
              Text(
                serieSelected.name,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              const Icon(
                Icons.star_half_rounded,
                color: Colors.amber,
              ),
              Text(
                "${serieSelected.populate}",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          background: Stack(
            children: [
              SizedBox.expand(
                child: CachedNetworkImage(
                  imageUrl: serieSelected.portada,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Image.asset('assets/bottle-loader.gif',
                          fit: BoxFit.cover),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const _GradientBox(
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 1.0],
              ),
              const _GradientBox(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topLeft,
                stops: [0.0, 0.3],
              ),
              const _GradientBox(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.4],
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
  }
}

class _GradientBox extends StatelessWidget {
  const _GradientBox({
    required this.colors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
  });
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
            stops: stops,
          ),
        ),
      ),
    );
  }
}
