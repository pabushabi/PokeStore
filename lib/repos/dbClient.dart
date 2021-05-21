// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:hive/hive.dart';
// import '/models/models.dart';
//
// class DbClient {
//   // var box = Hive.box("pokemon");
//   final database = () async =>  openDatabase(join(await getDatabasesPath(), 'pokemons.db'),
//       onCreate: (db, version) {
//   return db.execute(
//   "CREATE IF NOT EXISTS TABLE pokemons(id INTEGER, name TEXT, rarity TEXT, sypertype TEXT, subtypes TEXT, hp TEXT, attacks TEXT, set TEXT, images TEXT");
//   });
//
//   // DbClient({required this.database});
//
//   initDbClient() async {
//     return openDatabase(join(await getDatabasesPath(), 'pokemons.db'),
//         onCreate: (db, version) {
//       return db.execute(
//           "CREATE IF NOT EXISTS TABLE pokemons(id INTEGER, name TEXT, rarity TEXT, sypertype TEXT, subtypes TEXT, hp TEXT, attacks TEXT, set TEXT, images TEXT");
//     });
//   }
//
//   Future<List<Pokemon>> getAll() async {
//     final db = await openDatabase(join(await getDatabasesPath(), 'pokemons.db'));
//     final maps = await db.query('pokemons');
//     return List.generate(maps.length, (i) {
//       return Pokemon(
//           id: maps[i]['id'].toString(),
//           name: maps[i]['name'].toString(),
//           rarity: maps[i]['rarity'].toString(),
//           supertype: maps[i]['supertype'].toString(),
//           subtypes: [maps[i]['subtypes'].toString()],
//           hp: maps[i]['hp'].toString(),
//           // attacks: [maps[i]['attacks'].toString()],
//           // set: [maps[i]['set'].toString()],
//           // images: Map(maps[i]['images']), "");
//     });
//   }
//
//   set(List<Pokemon> pokemon) async {
//     final db = await openDatabase(join(await getDatabasesPath(), 'pokemons.db'),
//         onCreate: (db, version) {
//           return db.execute(
//               "CREATE TABLE IF NOT EXISTS pokemons(id TEXT, name TEXT, rarity TEXT, supertype TEXT, subtypes TEXT, hp TEXT, attacks TEXT, 'set' TEXT, images TEXT)");
//         },
//         version: 1);
//     for (var item in pokemon) {
//       await db.insert('pokemons', item.toJson(item));
//     }
//     // box.put(, value)
//   }
// }
