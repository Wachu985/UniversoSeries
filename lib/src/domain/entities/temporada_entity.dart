import 'package:isar/isar.dart';
part 'temporada_entity.g.dart';

@embedded
class TemporadaEntity {
  final String? name;
  final String? url;
  final List<String>? caps;
  final List<String>? subtitle;

  TemporadaEntity({
    this.name,
    this.url,
    this.caps,
    this.subtitle,
  });
}
