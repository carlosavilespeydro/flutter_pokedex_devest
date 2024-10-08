import 'package:dio/dio.dart';
import 'package:flutter_pokedex/models/pokemon.dart';

class PokemonData {


  static Future<Pokemon> getPokemonData( int pokemonId ) async {
    final dio = Dio();
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      Pokemon newPokemon = Pokemon.fromJson(response.data); 
      return newPokemon;

    } catch (e) {
      throw Exception("error");
    }

  }


}