import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_widgets.dart';

class CapturedPokemonView extends StatefulWidget {
  const CapturedPokemonView({super.key});

  @override
  State<CapturedPokemonView> createState() => _AllPokemonViewState();
}

class _AllPokemonViewState extends State<CapturedPokemonView> {
  
  @override
  void initState() {
    super.initState();

    PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemonBloc.fetchFirstPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    
    PokemonBloc pokemonBloc = context.watch<PokemonBloc>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: const Alignment(0, 0.1),
        colors: <Color>[
          Theme.of(context).colorScheme.primary,
          Color.fromARGB(255, 236, 234, 236),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: (pokemonBloc.state.pokemons.length > 20)
        ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: pokemonBloc.state.orderedPokemon.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: PokemonCardWidget(pokemon:pokemonBloc.state.orderedPokemon[index]),
              onTap: (){
                context.push('/detailed', extra: pokemonBloc.state.orderedPokemon[index].id);
              },  
            );
          },
        )
        :  Center(child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.inversePrimary,
        ))
      ),
    );
  }
}