import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '/models/pokemon.dart';

List<Pokemon> parseCards(String responseBody) {
  final parsed = jsonDecode(responseBody)["data"].cast<Map<String, dynamic>>();
  return parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
}

class ApiClient {
  final url = "https://api.pokemontcg.io/v2/";
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<List<Pokemon>> getCards() async {
    final url = Uri.parse("${this.url}cards");
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception("Data unavailable");
    return compute(parseCards, response.body);
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
