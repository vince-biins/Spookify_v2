// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/entity/category.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/icon_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final Categories categories;

  CategoryResponse({
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Categories {
  final List<CategoryItem> items;

  Categories({
    required this.items,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class CategoryItem {
  final String id;
  final String name;
  final List<IconResponse> icons;

  CategoryItem({
    required this.id,
    required this.name,
    required this.icons,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);

  @override
  String toString() => toJson().toString();

  Category toCategoryEntity() {
    return Category(
      id: id,
      name: name,
      imageUrl: icons.firstOrNull?.toImageObject(),
      artistName: null,
      type: TrackType.category,
    );
  }
}
