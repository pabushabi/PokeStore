import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokestore/models/models.dart';
import 'package:pokestore/repos/repos.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokeRepo repo;

  PokemonBloc({required this.repo}) : super(InitialPokemon());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonRequested) {
      yield LoadInProgressPokemon();
      try {
        final List<Pokemon> pokemons = await repo.getPokes();
        yield LoadSuccessPokemon(pokemons: pokemons);
      } catch (err, stack) {
        print(err);
        print(stack);
        yield LoadFailurePokemon();
      }
    }
  }
}
