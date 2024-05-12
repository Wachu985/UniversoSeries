import '../entities/entities.dart';

abstract class LocalStorageRepository {
  Future<void> toogleFavorite(SerieEntity media);
  Future<bool> isMediaFavorite(int mediaId);
  Future<List<SerieEntity>> loadMedias();
}
