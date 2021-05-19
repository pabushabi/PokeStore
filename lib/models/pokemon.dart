import 'package:json_annotation/json_annotation.dart';
import 'package:pokestore/models/attack.dart';
import 'package:pokestore/models/models.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final String name;
  final String? rarity;
  final String supertype;
  final List<String> subtypes;
  final String hp;
  final List<Attack>? attacks;
  final Set set;

  Pokemon({
    required this.name,
    required this.rarity,
    required this.supertype,
    required this.subtypes,
    required this.hp,
    required this.attacks,
    required this.set,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
