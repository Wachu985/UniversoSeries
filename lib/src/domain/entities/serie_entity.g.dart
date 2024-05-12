// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSerieEntityCollection on Isar {
  IsarCollection<SerieEntity> get serieEntitys => this.collection();
}

const SerieEntitySchema = CollectionSchema(
  name: r'SerieEntity',
  id: -3556665797637130280,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'populate': PropertySchema(
      id: 3,
      name: r'populate',
      type: IsarType.double,
    ),
    r'portada': PropertySchema(
      id: 4,
      name: r'portada',
      type: IsarType.string,
    ),
    r'poster': PropertySchema(
      id: 5,
      name: r'poster',
      type: IsarType.string,
    ),
    r'temporadas': PropertySchema(
      id: 6,
      name: r'temporadas',
      type: IsarType.objectList,
      target: r'TemporadaEntity',
    ),
    r'trailer': PropertySchema(
      id: 7,
      name: r'trailer',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.string,
    )
  },
  estimateSize: _serieEntityEstimateSize,
  serialize: _serieEntitySerialize,
  deserialize: _serieEntityDeserialize,
  deserializeProp: _serieEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'TemporadaEntity': TemporadaEntitySchema},
  getId: _serieEntityGetId,
  getLinks: _serieEntityGetLinks,
  attach: _serieEntityAttach,
  version: '3.1.0+1',
);

int _serieEntityEstimateSize(
  SerieEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdAt.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.portada.length * 3;
  bytesCount += 3 + object.poster.length * 3;
  bytesCount += 3 + object.temporadas.length * 3;
  {
    final offsets = allOffsets[TemporadaEntity]!;
    for (var i = 0; i < object.temporadas.length; i++) {
      final value = object.temporadas[i];
      bytesCount +=
          TemporadaEntitySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.trailer.length * 3;
  bytesCount += 3 + object.updatedAt.length * 3;
  return bytesCount;
}

void _serieEntitySerialize(
  SerieEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.populate);
  writer.writeString(offsets[4], object.portada);
  writer.writeString(offsets[5], object.poster);
  writer.writeObjectList<TemporadaEntity>(
    offsets[6],
    allOffsets,
    TemporadaEntitySchema.serialize,
    object.temporadas,
  );
  writer.writeString(offsets[7], object.trailer);
  writer.writeString(offsets[8], object.updatedAt);
}

SerieEntity _serieEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SerieEntity(
    createdAt: reader.readString(offsets[0]),
    description: reader.readString(offsets[1]),
    id: id,
    name: reader.readString(offsets[2]),
    populate: reader.readDouble(offsets[3]),
    portada: reader.readString(offsets[4]),
    poster: reader.readString(offsets[5]),
    temporadas: reader.readObjectList<TemporadaEntity>(
          offsets[6],
          TemporadaEntitySchema.deserialize,
          allOffsets,
          TemporadaEntity(),
        ) ??
        [],
    trailer: reader.readString(offsets[7]),
    updatedAt: reader.readString(offsets[8]),
  );
  return object;
}

P _serieEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readObjectList<TemporadaEntity>(
            offset,
            TemporadaEntitySchema.deserialize,
            allOffsets,
            TemporadaEntity(),
          ) ??
          []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _serieEntityGetId(SerieEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _serieEntityGetLinks(SerieEntity object) {
  return [];
}

void _serieEntityAttach(
    IsarCollection<dynamic> col, Id id, SerieEntity object) {}

extension SerieEntityQueryWhereSort
    on QueryBuilder<SerieEntity, SerieEntity, QWhere> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SerieEntityQueryWhere
    on QueryBuilder<SerieEntity, SerieEntity, QWhereClause> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SerieEntityQueryFilter
    on QueryBuilder<SerieEntity, SerieEntity, QFilterCondition> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> populateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'populate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      populateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'populate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      populateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'populate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> populateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'populate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      portadaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      portadaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> portadaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      portadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portada',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      portadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portada',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      posterGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poster',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      posterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poster',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> posterMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poster',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      posterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poster',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      posterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poster',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'temporadas',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      trailerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trailer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      trailerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition> trailerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trailer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      trailerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trailer',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      trailerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trailer',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedAt',
        value: '',
      ));
    });
  }
}

extension SerieEntityQueryObject
    on QueryBuilder<SerieEntity, SerieEntity, QFilterCondition> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterFilterCondition>
      temporadasElement(FilterQuery<TemporadaEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'temporadas');
    });
  }
}

extension SerieEntityQueryLinks
    on QueryBuilder<SerieEntity, SerieEntity, QFilterCondition> {}

extension SerieEntityQuerySortBy
    on QueryBuilder<SerieEntity, SerieEntity, QSortBy> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPopulate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populate', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPopulateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populate', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPortada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portada', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPortadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portada', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPoster() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poster', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByPosterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poster', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByTrailer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trailer', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByTrailerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trailer', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SerieEntityQuerySortThenBy
    on QueryBuilder<SerieEntity, SerieEntity, QSortThenBy> {
  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPopulate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populate', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPopulateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'populate', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPortada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portada', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPortadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portada', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPoster() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poster', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByPosterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poster', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByTrailer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trailer', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByTrailerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trailer', Sort.desc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SerieEntityQueryWhereDistinct
    on QueryBuilder<SerieEntity, SerieEntity, QDistinct> {
  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByPopulate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'populate');
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByPortada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portada', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByPoster(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poster', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByTrailer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trailer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SerieEntity, SerieEntity, QDistinct> distinctByUpdatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt', caseSensitive: caseSensitive);
    });
  }
}

extension SerieEntityQueryProperty
    on QueryBuilder<SerieEntity, SerieEntity, QQueryProperty> {
  QueryBuilder<SerieEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SerieEntity, double, QQueryOperations> populateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'populate');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> portadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portada');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> posterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poster');
    });
  }

  QueryBuilder<SerieEntity, List<TemporadaEntity>, QQueryOperations>
      temporadasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temporadas');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> trailerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trailer');
    });
  }

  QueryBuilder<SerieEntity, String, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
