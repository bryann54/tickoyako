import 'package:json_annotation/json_annotation.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final List<String> availableSeats;

  ShowModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.availableSeats,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
