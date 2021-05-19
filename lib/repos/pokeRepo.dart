import '/models/models.dart';
import 'apiClient.dart';

class PokeRepo {
  final ApiClient apiClient;

  PokeRepo({required this.apiClient});

  Future<List<Pokemon>> getPokes() async {
    return apiClient.getCards();
  }
}