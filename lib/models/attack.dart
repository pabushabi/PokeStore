import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

part "attack.g.dart";

@JsonSerializable()
class Attack {
  final String name;
  final String damage;
  final String text;

  Attack({
    required this.name,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) => _$AttackFromJson(json);
}
