import 'package:isar/isar.dart';
import 'package:multi_player/domain/entities/temporada_entity.dart';
part 'serie_entity.g.dart';

@collection
class SerieEntity {
  final Id id;
  final String name;
  final String portada;
  final String poster;
  final double populate;
  final String description;
  final String trailer;
  final String createdAt;
  final String updatedAt;
  final List<TemporadaEntity> temporadas;

  SerieEntity({
    required this.id,
    required this.name,
    required this.portada,
    required this.poster,
    required this.populate,
    required this.description,
    required this.trailer,
    required this.createdAt,
    required this.updatedAt,
    required this.temporadas,
  });
}
