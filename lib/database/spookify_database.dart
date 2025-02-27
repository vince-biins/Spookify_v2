import 'dart:async';

import 'package:floor/floor.dart';
import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/database/data/local/dao/save_category_dao.dart';
import 'package:spookify_v2/database/data/local/dao/track_dao.dart';
import 'package:spookify_v2/database/data/local/entity/save_category_entity.dart';
import 'package:spookify_v2/database/data/local/entity/track_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:spookify_v2/database/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';

part 'spookify_database.g.dart';

@Database(
    version: 1, entities: [FavoriteEntity, SaveCategoryEntity, TrackEntity])
abstract class SpookifyDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
  SavedCategoryDao get savedCategoryDao;
  TrackDao get trackDao;
}

class SpookifyDatabaseFactory {
  static final SpookifyDatabaseFactory _instance = SpookifyDatabaseFactory._();
  static Completer<SpookifyDatabase>? _completer;

  SpookifyDatabaseFactory._();

  factory SpookifyDatabaseFactory() {
    return _instance;
  }

  Future<SpookifyDatabase> getDatabase() async {
    if (_completer == null) {
      _completer = Completer<SpookifyDatabase>();
      $FloorSpookifyDatabase
          .databaseBuilder('spookify_database.db')
          .build()
          .then((value) {
        _completer!.complete(value);
      });
      return _completer!.future;
    }
    return _completer!.future;
  }
}
