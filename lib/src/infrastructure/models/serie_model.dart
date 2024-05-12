import 'dart:convert';

List<SerieModel> serieModelFromJson(String str) =>
    List<SerieModel>.from(json.decode(str).map((x) => SerieModel.fromJson(x)));

String serieModelToJson(List<SerieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SerieModel {
  final int id;
  final String name;
  final String portada;
  final String poster;
  final double populate;
  final String description;
  final String trailer;
  final String createdAt;
  final String updatedAt;
  final List<TemporadaModel> temporadas;

  SerieModel({
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

  factory SerieModel.fromJson(Map<String, dynamic> json) => SerieModel(
        id: json["id"],
        name: json["name"],
        portada: json["portada"],
        poster: json["poster"],
        populate: json["populate"]?.toDouble(),
        description: json["description"],
        trailer: json["trailer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        temporadas: List<TemporadaModel>.from(
            json["temporadas"].map((x) => TemporadaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "portada": portada,
        "poster": poster,
        "populate": populate,
        "description": description,
        "trailer": trailer,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "temporadas": List<dynamic>.from(temporadas.map((x) => x.toJson())),
      };
}

class TemporadaModel {
  final String name;
  final String url;
  final List<String> caps;

  TemporadaModel({
    required this.name,
    required this.url,
    required this.caps,
  });

  factory TemporadaModel.fromJson(Map<String, dynamic> json) => TemporadaModel(
        name: json["name"],
        url: json["url"],
        caps: List<String>.from(json["caps"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "caps": List<dynamic>.from(caps.map((x) => x)),
      };
}
