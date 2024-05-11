import 'package:multi_player/domain/datasources/media_datasource.dart';
import 'package:multi_player/domain/entities/serie_entity.dart';
import 'package:multi_player/domain/repositories/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDatasource datasource;

  MediaRepositoryImpl({required this.datasource});
  @override
  Future<List<SerieEntity>> findAllMedia() async {
    return await datasource.findAllMedia();
  }

  @override
  Future<SerieEntity> findOneMedia(int id) async {
    return await datasource.findOneMedia(id);
  }

  @override
  Future<List<SerieEntity>> findLastMedia(int limit, String field) async {
    return await datasource.findLastMedia(limit: limit, field: field);
  }

  @override
  Future<List<SerieEntity>> findPopulateMedia(int limit, String field) async {
    return await datasource.findPopulateMedia(limit: limit, field: field);
  }
}
