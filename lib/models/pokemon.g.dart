// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    name: json['name'] as String,
    rarity: json['rarity'] as String,
    type: json['type'] as String,
    subtypes:
        (json['subtypes'] as List<dynamic>).map((e) => e as String).toList(),
    hp: json['hp'] as int,
    attacks: (json['attacks'] as List<dynamic>)
        .map((e) => Attack.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'rarity': instance.rarity,
      'type': instance.type,
      'subtypes': instance.subtypes,
      'hp': instance.hp,
      'attacks': instance.attacks,
    };
