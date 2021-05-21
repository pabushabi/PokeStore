import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'observer.dart';
import 'repos/repos.dart';
import 'bloc/pokemon_bloc.dart';
import 'package:http/http.dart' as http;
import 'views/views.dart';

void main() {
  Bloc.observer = Observer();

  final PokeRepo pokeRepo =
      PokeRepo(apiClient: ApiClient(httpClient: http.Client()));

  runApp(App(pokeRepo: pokeRepo));
}

class App extends StatelessWidget {
  final PokeRepo pokeRepo;

  App({required this.pokeRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PokemonBloc(repo: pokeRepo),
        child: PokeStore(),
      ),
    );
  }
}
