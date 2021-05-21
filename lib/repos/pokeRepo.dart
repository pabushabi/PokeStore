import '/repos/repos.dart';
import '/models/models.dart';
import 'package:connectivity/connectivity.dart';

class PokeRepo {
  final ApiClient apiClient;

  PokeRepo({required this.apiClient});

  Future<List<Pokemon>> getPokes() async {
    // var cards;
    // // DbClient db = new DbClient();
    // var connect = await (Connectivity().checkConnectivity());
    // if (connect != ConnectivityResult.none) {
    //   cards = apiClient.getCards();
    //   db.set(await cards);
    // }
    // else {
    //   // cards = DbClient().get();
    // }

    return apiClient.getCards();
  }
}