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
    List<Pokemon> res = [];
    for (int i = 0; i < jsonDecode(response.body)["pageSize"]; i++) {
      res.add(Pokemon.fromJson(jsonDecode(response.body)["data"][i]));
    }
    return res;
  }

  Future<List<Pokemon>> search(String name) async {
    final url = Uri.parse("${this.url}cards?q=name:$name");
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception("Data unavailable");
    List<Pokemon> res = [];
    for (int i = 0; i < jsonDecode(response.body)["pageSize"]; i++) {
      res.add(Pokemon.fromJson(jsonDecode(response.body)["data"][i]));
    }
    return res;
  }
}
