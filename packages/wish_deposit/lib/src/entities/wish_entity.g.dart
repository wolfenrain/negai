// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishEntity _$WishEntityFromJson(Map<String, dynamic> json) => WishEntity(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      isFulfilled: json['isFulfilled'] as bool? ?? false,
    );

Map<String, dynamic> _$WishEntityToJson(WishEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isFulfilled': instance.isFulfilled,
    };
