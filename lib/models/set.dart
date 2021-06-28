import 'package:json_annotation/json_annotation.dart';

part 'set.g.dart';

@JsonSerializable()
class Set {
  final Map<String, String> images;

  Set({required this.images});

  factory Set.fromJson(Map<String, dynamic> json) =>
      _$SetFromJson(json);
}