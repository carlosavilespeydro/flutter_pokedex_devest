import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/blocs.dart';
import 'package:flutter_pokedex/blocs/theme/theme_cubit.dart';
import 'package:flutter_pokedex/ui/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';

class AllPokemonView extends StatefulWidget {
  const AllPokemonView({super.key});

  @override
  State<AllPokemonView> createState() => _AllPokemonViewState();
}

class _AllPokemonViewState extends State<AllPokemonView> {
  
  @override
  void initState() {
    super.initState();

    PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemonBloc.fetchFirstPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    
    PokemonBloc pokemonBloc = context.watch<PokemonBloc>();
    ThemeCubit themeCubit = context.watch<ThemeCubit>();
    themeCubit.setColorTheme(pokemonBloc.state.pokedexColor);
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
          itemCount: pokemonBloc.state.filteredPokemon.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: PokemonCardWidget(pokemon:pokemonBloc.state.filteredPokemon[index]),
              onTap: (){
                context.push('/detailed', extra: pokemonBloc.state.filteredPokemon[index].id);
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