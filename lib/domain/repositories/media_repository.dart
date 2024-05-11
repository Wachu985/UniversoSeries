import 'package:multi_player/domain/entities/serie_entity.dart';

abstract class MediaRepository {
  Future<List<SerieEntity>> findAllMedia();
  Future<SerieEntity> findOneMedia(int id);
  Future<List<SerieEntity>> findPopulateMedia(int limit, String field);
  Future<List<SerieEntity>> findLastMedia(int limit, String field);
}
