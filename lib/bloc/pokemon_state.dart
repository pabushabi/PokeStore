part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class InitialPokemon extends PokemonState {}
class LoadInProgressPokemon extends PokemonState {}
class LoadSuccessPokemon extends PokemonState {
  final List<Pokemon> pokemons;

  LoadSuccessPokemon({required this.pokemons});

  @override
  List<Object> get props => [pokemons];
}
class LoadFailurePokemon extends PokemonState {}