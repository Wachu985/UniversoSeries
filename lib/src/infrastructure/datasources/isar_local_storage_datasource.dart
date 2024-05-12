import 'package:isar/isar.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/entities/entities.dart';

class IsarLocalStorageDatasource implements LocalStorageDatasource {
  late Future<Isar> db;
  IsarLocalStorageDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [SerieEntitySchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMediaFavorite(int mediaId) async {
    final Isar isar = await db;
    final SerieEntity? isFavoriteMedia =
        await isar.serieEntitys.filter().idEqualTo(mediaId).findFirst();

    return isFavoriteMedia != null;
  }

  @override
  Future<List<SerieEntity>> loadMedias() async {
    final Isar isar = await db;
    // * Buscar en Database
    return isar.serieEntitys.where().findAll();
  }

  @override
  Future<void> toogleFavorite(SerieEntity media) async {
    final Isar isar = await db;
    final favoriteMedia =
        await isar.serieEntitys.filter().idEqualTo(media.id).findFirst();
    if (favoriteMedia != null) {
      // * Borrar de Database
      isar.writeTxnSync(() => isar.serieEntitys.deleteSync(favoriteMedia.id));
      return;
    }
    // * Escribir en Database
    isar.writeTxnSync(() => isar.serieEntitys.putSync(media));
  }
}
