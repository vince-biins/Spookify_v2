import 'package:floor/floor.dart';
import 'package:spookify_v2/utils/constants/constants.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/save_category_entity.dart';

@dao
abstract class SavedCategoryDao {
  @Query('SELECT * FROM $saveCategoryEntity')
  Future<List<SaveCategoryEntity>>? getAllSavedCategories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertCategory(SaveCategoryEntity category);

  @Query('SELECT * FROM  $saveCategoryEntity WHERE trackId = :id')
  Future<SaveCategoryEntity?> getCategoryById(String id);

  @Query('DELETE FROM  $saveCategoryEntity WHERE trackId = :id')
  Future<int?> deleteCategory(String id);
}
