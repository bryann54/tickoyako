// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      availableSeats: (json['availableSeats'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'availableSeats': instance.availableSeats,
    };
