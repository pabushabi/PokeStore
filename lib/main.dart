import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'observer.dart';
import 'repos/repos.dart';
import 'bloc/pokemon_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

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
      title: 'PokeStore',
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

class PokeStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeStore"),
        // actions: [],
      ),
      body: Center(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is InitialPokemon)
              return Center(
                  child: ElevatedButton(
                child: Text("Get"),
                onPressed: () {
                  BlocProvider.of<PokemonBloc>(context).add(PokemonRequested());
                },
              ));
            if (state is LoadInProgressPokemon)
              return Center(child: CircularProgressIndicator());
            if (state is LoadSuccessPokemon) {
              final pokemons = state.pokemons;
              print(pokemons.length);
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image(
                            height: 50,
                            width: 50,
                            image: CachedNetworkImageProvider('${pokemons[index].set.images["symbol"]}'),
                          ),
                          trailing: IconButton(
                            iconSize: 28,
                            icon: Icon(Icons.star_border_outlined),
                            onPressed: (){},
                          ),
                          title: Text(pokemons[index].name),
                          subtitle: Text(
                              "${pokemons[index].supertype} - ${pokemons[index].subtypes} (${pokemons[index].rarity})"),
                        ),
                      ],
                    ),
                  );
                },
              );
              // return Text("pokemons loaded. watch print");
            }
            return Text("Something went wrong");
          },
        ),
      ),
    );
  }
}
