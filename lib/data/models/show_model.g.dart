// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      id: json['id'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      imgUrl: json['imgUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'imgUrl': instance.imgUrl,
      'location': instance.location,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };
