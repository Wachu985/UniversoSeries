import 'package:dio/dio.dart';

import '../../core/environment/environment.dart';
import '../../domain/domain.dart';
import '../mappers/mappers.dart';
import '../models/serie_model.dart';

class MediaDioDatasource implements MediaDatasource {
  final dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.apiUrl));

  @override
  Future<List<SerieEntity>> findAllMedia() async {
    final response = await dio.get("medias");
    List<SerieModel> listModel = [];
    List<SerieEntity> listEntity = [];

    if (response.statusCode != 200) throw Exception();
    for (var element in response.data) {
      listModel.add(SerieModel.fromJson(element));
    }
    for (var model in listModel) {
      listEntity.add(SerieMapper.serieModeltoSerieEntity(model));
    }
    return listEntity;
  }

  @override
  Future<SerieEntity> findOneMedia(int id) async {
    final response = await dio.get("medias/$id");
    if (response.statusCode != 200) throw Exception();
    final model = SerieModel.fromJson(response.data);
    return SerieMapper.serieModeltoSerieEntity(model);
  }

  @override
  Future<List<SerieEntity>> findLastMedia(
      {int limit = 10, String field = "create_at"}) {
    // TODO: implement findLastMedia
    throw UnimplementedError();
  }

  @override
  Future<List<SerieEntity>> findPopulateMedia(
      {int limit = 10, String field = 'populate'}) {
    // TODO: implement findPopulateMedia
    throw UnimplementedError();
  }
}
