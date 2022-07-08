import 'package:flutter/material.dart';

import '../../models/pokemon_model.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Map<String, Color?> colors = {
      "grass": Colors.green[900],
      "poison": Colors.purple[900],
      "fire": Colors.orange[800],
      "water": Colors.lightBlue,
      "eletric": Colors.yellow[600],
      "bug": Colors.lightGreen,
      "flying": Colors.pink,
      "normal": Colors.grey,
    };

    final Iterable<Text> typeWidgets =
        pokemon.types.asMap().entries.map((entry) {
      int index = entry.key;
      String type = entry.value;

      return Text(
        index + 1 != pokemon.types.length ? "$type, " : type,
        style: TextStyle(
          color: colors[type],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("#${pokemon.number} ${pokemon.name}"),
      ),
      body: SizedBox(
        width: size.width,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  pokemon.image,
                  width: 250,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "#${pokemon.number!} ",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pokemon.name!,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Types: ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ...typeWidgets
              ])
            ],
          ),
        ]),
      ),
    );
  }
}
