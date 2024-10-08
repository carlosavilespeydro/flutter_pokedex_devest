part of 'pokemon_bloc.dart';

class PokemonEvent {
  const PokemonEvent();
}

final class PokemonAdded extends PokemonEvent{
  final Pokemon pokemon;
  const PokemonAdded(this.pokemon); 
}

final class CapturePokemon extends PokemonEvent{
  final int pokemonID;
  const CapturePokemon(this.pokemonID);
}

final class SetCustomFilterPokemon extends PokemonEvent{
  final String filter;
  const SetCustomFilterPokemon(this.filter);
}

final class SetCustomOrderEvent extends PokemonEvent {
  final PokemonOrder newOrder;
  const SetCustomOrderEvent({required this.newOrder});
}
