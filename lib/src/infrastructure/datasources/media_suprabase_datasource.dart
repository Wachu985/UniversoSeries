import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/domain.dart';
import '../mappers/serie_mapper.dart';
import '../models/serie_model.dart';

class MediaSuprabaseDatasource implements MediaDatasource {
  final _suprabase = Supabase.instance.client;
  @override
  Future<List<SerieEntity>> findAllMedia() async {
    final response = await _suprabase.rpc("findallseries");
    List<SerieModel> listModel = [];
    List<SerieEntity> listEntity = [];
    for (var element in response) {
      listModel.add(SerieModel.fromJson(element));
    }
    for (var model in listModel) {
      listEntity.add(SerieMapper.serieModeltoSerieEntity(model));
    }
    return listEntity;
  }

  @override
  Future<SerieEntity> findOneMedia(int id) async {
    final response = await _suprabase.rpc('findoneserie', params: {"id": id});
    // if (response.statusCode != 200) throw Exception();
    final model = SerieModel.fromJson(response.first);
    return SerieMapper.serieModeltoSerieEntity(model);
  }

  @override
  Future<List<SerieEntity>> findLastMedia(
      {int limit = 10, String field = "created_at"}) async {
    final response = await _suprabase
        .rpc("findspecific", params: {"lim": limit, "campo": field});
    List<SerieModel> listModel = [];
    List<SerieEntity> listEntity = [];
    for (var element in response) {
      listModel.add(SerieModel.fromJson(element));
    }
    for (var model in listModel) {
      listEntity.add(SerieMapper.serieModeltoSerieEntity(model));
    }
    return listEntity;
  }

  @override
  Future<List<SerieEntity>> findPopulateMedia(
      {int limit = 10, String field = 'populate'}) async {
    final response = await _suprabase
        .rpc("findspecific", params: {"lim": limit, "campo": field});
    List<SerieModel> listModel = [];
    List<SerieEntity> listEntity = [];
    for (var element in response) {
      listModel.add(SerieModel.fromJson(element));
    }
    for (var model in listModel) {
      listEntity.add(SerieMapper.serieModeltoSerieEntity(model));
    }
    return listEntity;
  }
}
