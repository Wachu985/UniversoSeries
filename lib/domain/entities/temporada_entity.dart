import 'package:isar/isar.dart';
part 'temporada_entity.g.dart';

@embedded
class TemporadaEntity {
  final String? name;
  final String? url;
  final List<String>? caps;

  TemporadaEntity({
    this.name,
    this.url,
    this.caps,
  });
}
