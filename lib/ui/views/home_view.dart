import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/blocs/blocs.dart';
import 'package:flutter_pokedex/ui/helpers/constants.dart';
import 'package:flutter_pokedex/ui/views/all_pokemon_view.dart';
import 'package:flutter_pokedex/ui/views/captured_pokemon_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {

    final tabCubit = context.watch<TabCubit>();
    PokemonBloc pokemonBloc = context.watch<PokemonBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Pokedex", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
        actions: (tabCubit.state == 0)
        ? [
          SizedBox(
            width: 150,
            child: TextField(
              onChanged: (value) {
                pokemonBloc.searchPokemon(value);
              },
              decoration:  InputDecoration(
                hintStyle: const TextStyle(color: Colors.white60),
                hintText: "Pika...",
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onPrimary),
              ),
              style: const TextStyle(color: Colors.white), // Texto blanco en el campo
            ),
          ),
        ]
        : [
          SegmentedButton(
          segments: const[
            ButtonSegment(value: PokemonOrder.id, icon: Text('ID')),
            ButtonSegment(value: PokemonOrder.type, icon: Text('Tipo')),
            ButtonSegment(value: PokemonOrder.alphabet, icon: Text('Nombre')),
          ], 
          selected: <PokemonOrder>{ pokemonBloc.state.order },
          selectedIcon: const SizedBox(),
          
          onSelectionChanged: (value) {
            pokemonBloc.changeOrder(value.first);
            
          },
        ),
        ]
      ),
      
      body: HomeTabs(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: <BottomNavigationBarItem>[
          _buildPokedexItem(Icons.home, 'Todos', context),
          _buildPokedexItem(Icons.search, 'Capturados', context),
        ],
        currentIndex: tabCubit.state,
        backgroundColor: const Color.fromARGB(255, 236, 234, 236),
        onTap: (index){
          tabCubit.selectedTab(index);
        }
      ),
    );
  }
}

  BottomNavigationBarItem _buildPokedexItem(IconData icon, String label, BuildContext context) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style:  const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      activeIcon: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style:  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      label:"",
    );
  }

class HomeTabs extends StatelessWidget {
  HomeTabs({
    super.key,
  });

final List<Widget> _pages = [
    const AllPokemonView(),
    const CapturedPokemonView()
,
  ];

  @override
  Widget build(BuildContext context) {
    return _pages[context.watch<TabCubit>().state];
  }
}
