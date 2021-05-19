import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/pokemon.dart';

class ApiClient {
  final url = "https://api.pokemontcg.io/v2/";
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<List<Pokemon>> getCards() async {
    final url = Uri.parse("${this.url}cards");
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception("Data unavailable");
    // print(Pokemon.fromJson(jsonDecode(response.body)["data"][1]).rarity);
    List<Pokemon> res = [];
    for (int i = 0; i < 250; i++) {
      // print(i);
      res.add(Pokemon.fromJson(jsonDecode(response.body)["data"][i]));
    }
    // return Pokemon.fromJson(jsonDecode(response.body)["data"]);
    return res;
  }

}
