import 'dart:convert';
import "package:http/http.dart" as http;
import "../models/pokemon_model.dart";

class PokemonRepository {
  PokemonRepository();

  String url = const String.fromEnvironment("BASE_URL");

  Future<List<PokemonModel>> getPokemons() async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw Exception("FAILED_TO_LOAD_POKEMONS");
      }

      var decoded = jsonDecode(response.body);
      print("decoded $decoded");
      return decoded.map<PokemonModel>((e) => PokemonModel.fromMap(e)).toList();
    } catch (e) {
      print(e);
      throw Exception("FAILED_TO_LOAD_POKEMONS");
    }
  }
}
