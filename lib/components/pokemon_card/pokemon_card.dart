import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

import '../pokemon_detail/pokemon_detail.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetail(pokemon: widget.pokemon),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[600],
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    widget.pokemon.image,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokemon.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
