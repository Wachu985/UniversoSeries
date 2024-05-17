import '../../domain/domain.dart';
import '../infrastructure.dart';

class SerieMapper {
  static SerieEntity serieModeltoSerieEntity(SerieModel model) => SerieEntity(
        id: model.id,
        name: model.name,
        poster: model.poster,
        createdAt: model.createdAt,
        description: model.description,
        populate: model.populate,
        portada: model.portada,
        trailer: model.trailer,
        updatedAt: model.updatedAt,
        temporadas: model.temporadas
            .map(
              (e) => TemporadaEntity(
                name: e.name,
                url: e.url,
                caps: e.caps,
                subtitle: e.subtitles,
              ),
            )
            .toList(),
      );
}
