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

  SavedCategoryDao? _savedCategoryDaoInstance;

  TrackDao? _trackDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `FAVORITE_ENTITY` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `imageUrl` TEXT NOT NULL, `trackId` TEXT NOT NULL, `title` TEXT NOT NULL, `artist` TEXT, `isFavorite` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SAVE_CATEGORY_ENTITY` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `trackId` TEXT NOT NULL, `title` TEXT NOT NULL, `imageUrl` TEXT, `artistName` TEXT, `type` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TRACK_ENTITY` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `categoryId` TEXT NOT NULL, `trackId` TEXT NOT NULL, `albumId` TEXT, `artistName` TEXT, `trackNumber` INTEGER, `type` INTEGER NOT NULL, `imageUrl` TEXT, `trackName` TEXT NOT NULL, `isFavorite` INTEGER NOT NULL, `durationMs` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }

  @override
  SavedCategoryDao get savedCategoryDao {
    return _savedCategoryDaoInstance ??=
        _$SavedCategoryDao(database, changeListener);
  }

  @override
  TrackDao get trackDao {
    return _trackDaoInstance ??= _$TrackDao(database, changeListener);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteEntityInsertionAdapter = InsertionAdapter(
            database,
            'FAVORITE_ENTITY',
            (FavoriteEntity item) => <String, Object?>{
                  'id': item.id,
                  'imageUrl': item.imageUrl,
                  'trackId': item.trackId,
                  'title': item.title,
                  'artist': item.artist,
                  'isFavorite': item.isFavorite ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteEntity> _favoriteEntityInsertionAdapter;

  @override
  Future<List<FavoriteEntity>?> findAllTracks() async {
    return _queryAdapter.queryList('SELECT * FROM  FAVORITE_ENTITY',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int?,
            trackId: row['trackId'] as String,
            title: row['title'] as String,
            imageUrl: row['imageUrl'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            artist: row['artist'] as String?));
  }

  @override
  Future<FavoriteEntity?> findTrackById(String id) async {
    return _queryAdapter.query(
        'SELECT * FROM FAVORITE_ENTITY WHERE trackId = ?1',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int?,
            trackId: row['trackId'] as String,
            title: row['title'] as String,
            imageUrl: row['imageUrl'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            artist: row['artist'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteTrack(String id) async {
    return _queryAdapter.query('DELETE FROM FAVORITE_ENTITY WHERE trackId = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertTrackFavorite(FavoriteEntity favorite) {
    return _favoriteEntityInsertionAdapter.insertAndReturnId(
        favorite, OnConflictStrategy.replace);
  }
}

class _$SavedCategoryDao extends SavedCategoryDao {
  _$SavedCategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _saveCategoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'SAVE_CATEGORY_ENTITY',
            (SaveCategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'trackId': item.trackId,
                  'title': item.title,
                  'imageUrl': item.imageUrl,
                  'artistName': item.artistName,
                  'type': item.type.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SaveCategoryEntity>
      _saveCategoryEntityInsertionAdapter;

  @override
  Future<List<SaveCategoryEntity>>? getAllSavedCategories() async {
    return _queryAdapter.queryList('SELECT * FROM SAVE_CATEGORY_ENTITY',
        mapper: (Map<String, Object?> row) => SaveCategoryEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            trackId: row['trackId'] as String,
            imageUrl: row['imageUrl'] as String?,
            artistName: row['artistName'] as String?,
            type: TrackType.values[row['type'] as int]));
  }

  @override
  Future<SaveCategoryEntity?> getCategoryById(String id) async {
    return _queryAdapter.query(
        'SELECT * FROM  SAVE_CATEGORY_ENTITY WHERE trackId = ?1',
        mapper: (Map<String, Object?> row) => SaveCategoryEntity(
            id: row['id'] as int?,
            title: row['title'] as String,
            trackId: row['trackId'] as String,
            imageUrl: row['imageUrl'] as String?,
            artistName: row['artistName'] as String?,
            type: TrackType.values[row['type'] as int]),
        arguments: [id]);
  }

  @override
  Future<int?> deleteCategory(String id) async {
    return _queryAdapter.query(
        'DELETE FROM  SAVE_CATEGORY_ENTITY WHERE TrackId = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int> insertCategory(SaveCategoryEntity category) {
    return _saveCategoryEntityInsertionAdapter.insertAndReturnId(
        category, OnConflictStrategy.replace);
  }
}

class _$TrackDao extends TrackDao {
  _$TrackDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trackEntityInsertionAdapter = InsertionAdapter(
            database,
            'TRACK_ENTITY',
            (TrackEntity item) => <String, Object?>{
                  'id': item.id,
                  'categoryId': item.categoryId,
                  'trackId': item.trackId,
                  'albumId': item.albumId,
                  'artistName': item.artistName,
                  'trackNumber': item.trackNumber,
                  'type': item.type.index,
                  'imageUrl': item.imageUrl,
                  'trackName': item.trackName,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'durationMs': item.durationMs
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrackEntity> _trackEntityInsertionAdapter;

  @override
  Future<List<TrackEntity>> getTrackForCategory(int categoryId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TRACK_ENTITY WHERE categoryId = ?1',
        mapper: (Map<String, Object?> row) => TrackEntity(
            id: row['id'] as int?,
            categoryId: row['categoryId'] as String,
            trackId: row['trackId'] as String,
            albumId: row['albumId'] as String?,
            artistName: row['artistName'] as String?,
            trackNumber: row['trackNumber'] as int?,
            type: TrackType.values[row['type'] as int],
            imageUrl: row['imageUrl'] as String?,
            trackName: row['trackName'] as String,
            isFavorite: (row['isFavorite'] as int) != 0,
            durationMs: row['durationMs'] as int),
        arguments: [categoryId]);
  }

  @override
  Future<int?> deleteAllForCategory(int categoryId) async {
    return _queryAdapter.query('DELETE FROM TRACK_ENTITY WHERE categoryId = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [categoryId]);
  }

  @override
  Future<List<int>> insertAllTracks(List<TrackEntity> music) {
    return _trackEntityInsertionAdapter.insertListAndReturnIds(
        music, OnConflictStrategy.replace);
  }
}
