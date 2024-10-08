part of 'pokemon_bloc.dart';

class PokemonState {
  final PokemonOrder order;
  final String filter; 
  final List<Pokemon> pokemons;
  
  const PokemonState({
    this.order = PokemonOrder.id,
    this.filter = "",
    this.pokemons = const []
  });

  List<Pokemon> get orderedPokemon {
    switch(order){
      case PokemonOrder.id:
        List<Pokemon> capturedPokemons = pokemons.where((pokemon) => pokemon.captured == true).toList();
        capturedPokemons.sort((a, b) => a.id!.compareTo(b.id!));
        return capturedPokemons;
      case PokemonOrder.type:
        List<Pokemon> capturedPokemons = pokemons.where((pokemon) => pokemon.captured == true).toList();
        capturedPokemons.sort((a, b) => a.types!.first.type!.name.compareTo(b.types!.first.type!.name));
        return capturedPokemons;
      case PokemonOrder.alphabet:
        List<Pokemon> capturedPokemons = pokemons.where((pokemon) => pokemon.captured == true).toList();
        capturedPokemons.sort((a, b) => a.name!.compareTo(b.name!));    
        return capturedPokemons;
    }
  }

  Color? get pokedexColor {

    final pokemonTypesCount = pokemons.where((pokemon) => pokemon.captured == true).fold({}, (acc, curr) {
      acc[curr.types!.first.type!] = (acc[curr.types!.first.type!] ?? 0) + 1;
      return acc;
    });

    final sortedKeys = pokemonTypesCount.keys
        .toList()
        ..sort((a, b) => pokemonTypesCount[b].compareTo(pokemonTypesCount[a]));

    final sortedValues = pokemonTypesCount.values
        .toList()
        ..sort((a, b) => b.compareTo(a));

    if(sortedValues.isNotEmpty && pokemons.length >= 150){

      if(sortedValues.length == 1){
        return sortedKeys.first.color;
      }else if(sortedValues.first != sortedValues[1]){
        return sortedKeys.first.color;
      }

    }

    return null;

  }

  List<Pokemon> get filteredPokemon {
    if(filter != ""){
      List<Pokemon> filteredPokemons = pokemons.where((pokemon) => pokemon.name!.contains(filter)).toList();
      return filteredPokemons;
    }
    return pokemons;

  }

  PokemonState copyWith({
    PokemonOrder? order,
    String? filter,
    List<Pokemon>? pokemons,
    
  }) => PokemonState(
    order: order ?? this.order,
    filter: filter ?? this.filter,
    pokemons: pokemons ?? this.pokemons,
  );
}

