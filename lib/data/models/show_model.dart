import 'package:json_annotation/json_annotation.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  final String id;
  final String type;
  final String imgUrl;
  final String location;
  final String title;
  final String description;
  final DateTime date;


  ShowModel({
    required this.id,
    required this.type,
    required this.location,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.date,
    
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
