// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attack _$AttackFromJson(Map<String, dynamic> json) {
  return Attack(
    name: json['name'] as String,
    damage: json['damage'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$AttackToJson(Attack instance) => <String, dynamic>{
      'name': instance.name,
      'damage': instance.damage,
      'text': instance.text,
    };
