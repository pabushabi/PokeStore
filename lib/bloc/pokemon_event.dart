part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonRequested extends PokemonEvent {
  const PokemonRequested();

  @override
  List<Object> get props => [];
}
