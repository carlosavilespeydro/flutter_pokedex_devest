import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';

class PokemonCardWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(4, 0.1),
          colors: <Color>[
            (pokemon.captured!) ? pokemon.types!.first.type!.color : Colors.grey[400]!,
            const Color.fromARGB(255, 236, 234, 236),
            ],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FittedBox(
              fit: BoxFit.fitWidth, 
              child: Text(pokemon.name!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ),
          ),
          Expanded(
            child: Image.network(
              pokemon.sprites!.frontDefault!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}