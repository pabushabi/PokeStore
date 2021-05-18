import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokestore/models/pokemon.dart';

class ApiClient {
  final url = "https://api.pokemontcg.io/v2/";
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<Pokemon> getCards() async {
    final url = Uri.parse("${this.url}cards");
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception("Data unavailable");
    return Pokemon.fromJson(jsonDecode(response.body)["data"]);
  }

}
