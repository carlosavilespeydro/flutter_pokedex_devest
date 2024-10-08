import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/blocs.dart';
import 'package:flutter_pokedex/blocs/theme/theme_cubit.dart';
import 'package:flutter_pokedex/models/pokemon.dart';


class DetailedPokemonView extends StatelessWidget {
  final int pokemonId;
  const DetailedPokemonView({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
    Pokemon selectedPokemon = pokemonBloc.getPokemonData(pokemonId);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedPokemon.types!.first.type!.color,
        title: Text(selectedPokemon.id.toString()),
      ),
      body: DetailedPokemonApp(selectedPokemon: selectedPokemon),
    );
  }
}

class DetailedPokemonApp extends StatelessWidget {
  const DetailedPokemonApp({
    super.key,
    required this.selectedPokemon,
  });

  final Pokemon selectedPokemon;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
    ThemeCubit themeCubit = context.watch<ThemeCubit>();
    
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0, 0.1),
          colors: <Color>[
            selectedPokemon.types!.first.type!.color,
            const Color.fromARGB(255, 236, 234, 236),
            ],
            tileMode: TileMode.clamp,
          ),
      ),
      child: Padding(
      
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:[
                Column(
                  children: [
                    Text(selectedPokemon.name!.toUpperCase(), style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, ),),
                    SizedBox(
                      
                      height: size.height * 0.4,
                      child: Image.network(
                        selectedPokemon.sprites!.other!.home!.frontDefault!,
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width *0.3,                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tipo", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,  )),
                          const Divider(),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedPokemon.types!.length ,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Text(
                                  selectedPokemon.types![index].type!.name, 
                                  style: TextStyle(
                                    fontSize: 28, 
                                    fontWeight: FontWeight.bold,
                                    
                                    color: selectedPokemon.types![index].type!.color
                                   )));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Altura: ${selectedPokemon.height}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, ),),
                        Text("Peso: ${selectedPokemon.weight}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, ),),
                      ],
                    ),  
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width *0.8,
                  child: SwitchListTile(
                    title: const Text("Capturado", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    value: selectedPokemon.captured!, 
                    onChanged: ( value ) async {
                      await pokemonBloc.capturePokemon(selectedPokemon.id!);
                      themeCubit.setColorTheme(pokemonBloc.state.pokedexColor);
                    }
                  ),
                ) 
              ] 
            ),
          ],
        ),
      ),
    );
  }
}