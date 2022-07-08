import 'package:flutter/material.dart';
import 'package:flutter_pokedex/components/pokemon_card/pokemon_card.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonRepository pokemonRepository = PokemonRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Pokédex"),
      ),
      body: FutureBuilder<List<PokemonModel>>(
        future: pokemonRepository.getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.green[900]),
            );
          }
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: [
                ...List.generate(snapshot.data!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PokemonCard(pokemon: snapshot.data![index]),
                  );
                }),
              ],
            );
          }

          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        },
      ),
    );
  }
}
