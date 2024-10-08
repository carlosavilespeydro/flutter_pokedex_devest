import 'package:flutter_pokedex/blocs/theme/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit(){

  getIt.registerSingleton(TabCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(PokemonBloc());

}