import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:spookify_v2/features/playlist/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/features/playlist/data/local/model/favorite_dao.dart';

part 'spookify_database.g.dart';

@Database(version: 1, entities: [FavoriteEntity])
abstract class SpookifyDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
}
