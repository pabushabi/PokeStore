import 'package:flutter/material.dart';
import '/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatelessWidget {
  final List<Pokemon> pokemons;
  final int index;

  Details({required this.pokemons, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${pokemons[index].name}"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.star_border_outlined),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 18, color: Colors.black),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CachedNetworkImage(
                      width: 300,
                      height: 300,
                      placeholder: (context, _) {
                        return Center(child: CircularProgressIndicator());
                      },
                      imageUrl: "${pokemons[index].images["large"]}"
                  ),
                ),
                Text("Супертип: ${pokemons[index].supertype}"),
                Text("Подтипы: ${pokemons[index].subtypes}"),
                Text("Редкость: ${pokemons[index].rarity}"),
                Text("Здоровье: ${pokemons[index].hp}"),
                Text("Атаки: "),
                Text("1: ${pokemons[index].attacks?.first.name}"),
                Text("Урон: ${pokemons[index].attacks?.first.damage}"),
                Text("${pokemons[index].attacks?.first.text}"),
                Text("2: ${pokemons[index].attacks?.last.name}"),
                Text("Урон: ${pokemons[index].attacks?.last.damage}"),
                Text("${pokemons[index].attacks?.last.text}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
