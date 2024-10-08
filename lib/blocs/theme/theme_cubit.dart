import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'themet_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {

  ThemeCubit({
    Color color = const Color(0xFFCC0000)
  }) : super(ThemeCubitState(pokedexColor: color));

  void setColorTheme (Color? color){
    emit( ThemeCubitState(pokedexColor: color ?? const Color(0xFFCC0000)));
  }

}