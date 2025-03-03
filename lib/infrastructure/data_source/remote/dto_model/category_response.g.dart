// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      categories:
          Categories.fromJson(json['categories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      items: (json['items'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      id: json['id'] as String,
      name: json['name'] as String,
      icons: (json['icons'] as List<dynamic>)
          .map((e) => IconResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icons': instance.icons,
    };
