import 'package:multi_player/domain/entities/serie_entity.dart';

abstract class MediaDatasource {
  Future<List<SerieEntity>> findAllMedia();
  Future<SerieEntity> findOneMedia(int id);
  Future<List<SerieEntity>> findPopulateMedia(
      {int limit = 10, String field = 'populate'});
  Future<List<SerieEntity>> findLastMedia(
      {int limit = 10, String field = "created_at"});
}
