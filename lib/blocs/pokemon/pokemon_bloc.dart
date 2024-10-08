import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/pokemon_data.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/ui/helpers/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {

    on<PokemonAdded>((event, emit){

      final newPokemons = List<Pokemon>.from(state.pokemons);
      newPokemons.add(event.pokemon);
      emit (state.copyWith(pokemons: newPokemons));
    });

    on<CapturePokemon> (_capturePokemonHandler);

    on<SetCustomFilterPokemon> ((event, emit) {
      emit(state.copyWith(filter: event.filter));
    });    
    on<SetCustomOrderEvent>((event, emit) {
      emit(state.copyWith(order: event.newOrder));
    });    
  }

  Future<List<Pokemon>> fetchFirstPokemonData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> capturedPokemonSharedPreferences = prefs.getStringList('capturedPokemon') ?? [];
    try {
      
      if(state.pokemons.isEmpty){

        for (int i = 1; i < 30; i++) {
          final newPokemon = await PokemonData.getPokemonData(i);
          String? capturedPokemonID = capturedPokemonSharedPreferences.firstWhereOrNull((pokemonID) => pokemonID == newPokemon.id.toString());
          newPokemon.captured = (capturedPokemonID != null);
          add(PokemonAdded(newPokemon));
        }
        fetchAllPokemonData();
      }
      return List<Pokemon>.from(state.pokemons);

    } catch (e) {
      throw Exception("Error al recibir los primeros pokemons");
    }
  }

  Future<void> capturePokemon(int id) async{
    add(CapturePokemon(id));
  }

  void _capturePokemonHandler(CapturePokemon event, Emitter<PokemonState> emit) async{

    final pokemonList = state.pokemons.map((pokemon) {
      if ( pokemon.id == event.pokemonID){

        saveCapturedPokemonSharedPreferences(pokemon.id!, !pokemon.captured!);

        return pokemon.copyWith(
          captured: !pokemon.captured!
        );
      }
      return pokemon;
    }).toList();

    emit(state.copyWith(pokemons: pokemonList));
  }  

  void saveCapturedPokemonSharedPreferences(int pokemonID, bool captured) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> capturedPokemon = (prefs.getStringList('capturedPokemon') ?? []);
    if(captured){
      capturedPokemon.add(pokemonID.toString());
    }else{
      capturedPokemon.removeWhere((String capturedPokemon) => capturedPokemon == pokemonID.toString());
    }
    prefs.setStringList("capturedPokemon", capturedPokemon);    
  }

  void searchPokemon(String searchText){
    add(SetCustomFilterPokemon(searchText));
  }

  void changeOrder(PokemonOrder newOrder){
    add(SetCustomOrderEvent(newOrder: newOrder));
  }

  void fetchAllPokemonData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> capturedPokemonSharedPreferences = prefs.getStringList('capturedPokemon') ?? [];
    try {
        for (int i = 30; i <= 150; i++) {
          final newPokemon = await PokemonData.getPokemonData(i);
          add(PokemonAdded(newPokemon));
          String? capturedPokemonID = capturedPokemonSharedPreferences.firstWhereOrNull((pokemonID) => pokemonID == newPokemon.id.toString());
          newPokemon.captured = (capturedPokemonID != null);
        }
    } catch (e) {
      throw Exception("Error al recibir el resto de pokemons");
    }
  }

  Pokemon getPokemonData(int id){
    return state.pokemons.firstWhere((pokemon) => pokemon.id == id );
  }

}
