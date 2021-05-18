import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokestore/models/attack.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final String name;
  final String rarity;
  final String type;
  final List<String> subtypes;
  final int hp;
  final List<Attack> attacks;

  Pokemon({
    required this.name,
    required this.rarity,
    required this.type,
    required this.subtypes,
    required this.hp,
    required this.attacks,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
