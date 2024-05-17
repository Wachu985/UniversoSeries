import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_player/src/domain/entities/serie_entity.dart';
import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/src/presentation/widgets/widgets.dart';

import '../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    final textTraslate = S.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (state.mediaStatus == MediaStatus.loading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    } else if (state.mediaStatus == MediaStatus.error) {
      return ErrorCustomWidget(text: S.current.mediaViewText2);
    } else if (state.populateMedia.isEmpty || state.lastMedia.isEmpty) {
      return ErrorCustomWidget(text: S.current.mediaViewText1);
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            const LastSeriesWidget(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  textTraslate.homeViewText,
                  style: textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 300,
              child: PageViewCustom(),
            )
          ],
        ),
      );
    }
  }
}

class LastSeriesWidget extends StatelessWidget {
  const LastSeriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        height: 430,
        width: double.infinity,
        child: Swiper(
          onTap: (index) {
            context
                .read<MediaBloc>()
                .add(SelectSerie(serie: state.lastMedia[index]));
            context.go('/home/0/detail/');
          },
          // duration: 8,
          itemBuilder: (BuildContext context, int index) {
            return SwiperMedia(media: state.lastMedia[index]);
          },
          itemCount: state.lastMedia.length,
          curve: Curves.decelerate,
          viewportFraction: 0.7,
          autoplay: true,
          scale: 0.75,
        ),
      ),
    );
  }
}

class PageViewCustom extends StatelessWidget {
  const PageViewCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    return Swiper(
      itemCount: state.populateMedia.length,
      onTap: (index) {
        context
            .read<MediaBloc>()
            .add(SelectSerie(serie: state.populateMedia[index]));
        context.go('/home/0/detail/');
      },
      itemBuilder: (BuildContext context, int index) {
        return SwiperMedia(media: state.populateMedia[index]);
      },
      curve: Curves.decelerate,
      viewportFraction: 0.4,
      autoplay: false,
      scale: 0.75,
    );
  }
}

class SwiperMedia extends StatelessWidget {
  const SwiperMedia({
    super.key,
    required this.media,
  });

  final SerieEntity media;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: media.poster,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Image.asset('assets/bottle-loader.gif', fit: BoxFit.cover),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.center,
                  colors: [Colors.transparent, Colors.black45],
                  transform: GradientRotation(49.7),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  transform: GradientRotation(51.9),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_half_rounded,
                    color: Colors.yellow,
                  ),
                  Text(
                    '${media.populate}',
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                media.name,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
          FutureBuilder<bool>(
              future: context.read<MediaBloc>().checkFavorite(media.id),
              builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () => context.read<MediaBloc>().add(
                            MediaEvent.toogleFavorite(media: media),
                          ),
                      icon: Icon(
                        snapshot.data ?? false
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color:
                            snapshot.data ?? false ? Colors.red : Colors.white,
                      )),
                );
              })
        ],
      ),
    );
  }
}
