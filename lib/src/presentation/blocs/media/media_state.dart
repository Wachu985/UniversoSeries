part of 'media_bloc.dart';

enum MediaStatus { initial, loading, success, error }

class MediaState extends Equatable {
  final List<SerieEntity> series;
  final List<SerieEntity> favorites;
  final List<SerieEntity> lastMedia;
  final List<SerieEntity> populateMedia;
  final MediaStatus mediaStatus;
  final SerieEntity? serieSelected;

  const MediaState({
    this.serieSelected,
    this.series = const [],
    this.favorites = const [],
    this.mediaStatus = MediaStatus.initial,
    this.lastMedia = const [],
    this.populateMedia = const [],
  });

  factory MediaState.initialState() => const MediaState();

  MediaState copyWith({
    List<SerieEntity>? series,
    MediaStatus? mediaStatus,
    SerieEntity? serieSelected,
    List<SerieEntity>? favorites,
    List<SerieEntity>? lastMedia,
    List<SerieEntity>? populateMedia,
  }) =>
      MediaState(
        mediaStatus: mediaStatus ?? this.mediaStatus,
        series: series ?? this.series,
        favorites: favorites ?? this.favorites,
        serieSelected: serieSelected ?? this.serieSelected,
        lastMedia: lastMedia ?? this.lastMedia,
        populateMedia: populateMedia ?? this.populateMedia,
      );

  @override
  List<Object?> get props => [
        series,
        mediaStatus,
        serieSelected,
        lastMedia,
        populateMedia,
      ];
}
