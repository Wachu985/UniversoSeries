import 'package:multi_player/domain/entities/serie_entity.dart';

import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDatasource datasource;
  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isMediaFavorite(int mediaId) {
    return datasource.isMediaFavorite(mediaId);
  }

  @override
  Future<List<SerieEntity>> loadMedias() {
    return datasource.loadMedias();
  }

  @override
  Future<void> toogleFavorite(SerieEntity media) {
    return datasource.toogleFavorite(media);
  }
}
