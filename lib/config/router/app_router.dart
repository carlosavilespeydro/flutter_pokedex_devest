import 'package:flutter_pokedex/ui/views/detailed_pokemon_view.dart';
import 'package:flutter_pokedex/ui/views/home_view.dart';
import 'package:go_router/go_router.dart';



final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),

    GoRoute(
      path: '/detailed',
      builder: (context, state) {
        final pokemonId = state.extra! as int;
      return DetailedPokemonView(
        pokemonId: pokemonId,
      );
    },
      
    ),    
  ]);