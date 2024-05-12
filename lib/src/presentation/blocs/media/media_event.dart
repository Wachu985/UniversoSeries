part of 'media_bloc.dart';

sealed class MediaEvent {
  factory MediaEvent.fetchData() => FetchDataEvent();
  factory MediaEvent.cleanSerie() => CleanSerie();
  factory MediaEvent.fetchPopulateMedia() => FetchPopulateMedia();
  factory MediaEvent.fetchLastMedia() => FetchLastMedia();
  factory MediaEvent.loadFavorites() => LoadFavorites();
  factory MediaEvent.checkFavorites({required int mediaId}) =>
      CheckFavorites(mediaId: mediaId);
  factory MediaEvent.selecSerie({required SerieEntity serie}) =>
      SelectSerie(serie: serie);
  factory MediaEvent.toogleFavorite({required SerieEntity media}) =>
      ToogleFavorite(media: media);
}

class FetchDataEvent implements MediaEvent {}

class SelectSerie implements MediaEvent {
  final SerieEntity serie;

  SelectSerie({required this.serie});
}

class CleanSerie implements MediaEvent {}

class LoadFavorites implements MediaEvent {}

class CheckFavorites implements MediaEvent {
  final int mediaId;

  CheckFavorites({required this.mediaId});
}

class ToogleFavorite implements MediaEvent {
  final SerieEntity media;

  ToogleFavorite({required this.media});
}

class FetchPopulateMedia implements MediaEvent {}

class FetchLastMedia implements MediaEvent {}
