import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokestore/bloc/pokemon_bloc.dart';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokestore/views/views.dart';

class PokeStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeStore"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          OpenContainer(
              openBuilder: (context, _) {
                return Scaffold(
                  appBar: AppBar(title: TextField(
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, ),
                  ),),
                    body: Center(
                  child: Text("search"),
                ));
              },
              transitionType: ContainerTransitionType.fade,
              closedElevation: 0,
              closedColor: Color.fromARGB(0, 0, 0, 0),
              closedBuilder: (context, openContainer) {
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Icon(Icons.search),
                  ),
                );
              })
        ],
      ),
      body: Center(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is InitialPokemon)
              BlocProvider.of<PokemonBloc>(context).add(PokemonRequested());
            if (state is LoadInProgressPokemon)
              return Center(child: CircularProgressIndicator());
            if (state is LoadSuccessPokemon) {
              final pokemons = state.pokemons;
              print(pokemons.length);
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  return OpenContainer(
                      openBuilder: (context, _) {
                        return Details(pokemons: pokemons, index: index);
                      },
                      transitionType: ContainerTransitionType.fade,
                      closedElevation: 0,
                      closedColor: Color.fromARGB(0, 0, 0, 0),
                      closedBuilder: (context, openContainer) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: CachedNetworkImageProvider(
                                  '${pokemons[index].set.images["symbol"]}'),
                            ),
                            trailing: IconButton(
                              iconSize: 28,
                              icon: Icon(Icons.star_border_outlined),
                              onPressed: () {},
                            ),
                            title: Text(pokemons[index].name),
                            subtitle: Text(
                                "${pokemons[index].supertype} - ${pokemons[index].subtypes} (${pokemons[index].rarity})"),
                          ),
                        );
                      });
                },
              );
            }
            return Text("Something went wrong");
          },
        ),
      ),
    );
  }
}
