import '../../domain/entities/serie_entity.dart';
import '../../domain/entities/temporada_entity.dart';
import '../../presentation/blocs/media/media_bloc.dart';

SerieEntity getSerie(int serieId, MediaState state) {
  for (var serie in state.series) {
    if (serie.id == serieId) {
      return serie;
    }
  }
  return SerieEntity(
      id: 1,
      name: "",
      poster: "",
      createdAt: "",
      description: "",
      populate: 0,
      portada: "",
      trailer: "",
      updatedAt: "",
      temporadas: [
        TemporadaEntity(caps: [""], name: "", url: "")
      ]);
}

TemporadaEntity getTemporada(String tempID, SerieEntity serie) {
  for (var temporadas in serie.temporadas) {
    if (temporadas.name == tempID) {
      return temporadas;
    }
  }
  return TemporadaEntity(caps: [""], name: "", url: "");
}
