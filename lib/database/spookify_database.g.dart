// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spookify_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $SpookifyDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $SpookifyDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $SpookifyDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<SpookifyDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorSpookifyDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $SpookifyDatabaseBuilderContract databaseBuilder(String name) =>
      _$SpookifyDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $SpookifyDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$SpookifyDatabaseBuilder(null);
}

class _$SpookifyDatabaseBuilder implements $SpookifyDatabaseBuilderContract {
  _$SpookifyDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $SpookifyDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $SpookifyDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<SpookifyDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SpookifyDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SpookifyDatabase extends SpookifyDatabase {
  _$SpookifyDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteDao? _favoriteDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FavoriteEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `trackId` TEXT NOT NULL, `title` TEXT NOT NULL, `isFavorite` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteEntityInsertionAdapter = InsertionAdapter(
            database,
            'FavoriteEntity',
            (FavoriteEntity item) => <String, Object?>{
                  'id': item.id,
                  'trackId': item.trackId,
                  'title': item.title,
                  'isFavorite': item.isFavorite ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteEntity> _favoriteEntityInsertionAdapter;

  @override
  Future<List<FavoriteEntity>?> findAllTracks() async {
    return _queryAdapter.queryList('SELECT * FROM FavoriteEntity',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int?,
            trackId: row['trackId'] as String,
            title: row['title'] as String,
            isFavorite: (row['isFavorite'] as int) != 0));
  }

  @override
  Future<FavoriteEntity?> findTrackById(int id) async {
    return _queryAdapter.query('SELECT * FROM FavoriteEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int?,
            trackId: row['trackId'] as String,
            title: row['title'] as String,
            isFavorite: (row['isFavorite'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> deleteTrack(String id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM FavoriteEntity WHERE trackId = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertTrackFavorite(FavoriteEntity favorite) async {
    await _favoriteEntityInsertionAdapter.insert(
        favorite, OnConflictStrategy.abort);
  }
}
