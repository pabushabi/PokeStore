// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as String,
    name: json['name'] as String,
    rarity: json['rarity'] as String?,
    supertype: json['supertype'] as String,
    subtypes:
        (json['subtypes'] as List<dynamic>).map((e) => e as String).toList(),
    hp: json['hp'] as String,
    attacks: (json['attacks'] as List<dynamic>?)
        ?.map((e) => Attack.fromJson(e as Map<String, dynamic>))
        .toList(),
    set: Set.fromJson(json['set'] as Map<String, dynamic>),
    images: Map<String, String>.from(json['images'] as Map),
  );
}

// Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'rarity': instance.rarity,
//       'supertype': instance.supertype,
//       'subtypes': instance.subtypes.toString(),
//       'hp': instance.hp,
//       'attacks': instance.attacks.toString(),
//       'set': instance.set.toString(),
//       'images': instance.images.toString(),
//     };
