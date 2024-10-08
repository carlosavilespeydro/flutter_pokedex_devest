import 'package:flutter/material.dart';


enum PokemonOrder {
  id,
  type,
  alphabet,
}

enum PokemonTypes{

  normal("normal", Color(0xFFAAB09F)),
  fighting("Lucha", Color(0xFFcb5f48)),
  flying("Volador", Color(0xFF7da6de)),
  poison("Veneno", Color(0xFFb468b7)),
  ground("Tierra", Color(0xFFcc9f4f)),
  rock("Roca", Color(0xFFb2a061)),
  bug("Bicho", Color(0xFF94bc4a)),
  ghost("Fantasma", Color(0xFF846ab6)),
  steel("Acero", Color(0xFF89a1b0)),
  fire("Fuego", Color(0xFFea7a3c)),
  water("Agua", Color(0xFF539ae2)),
  grass("Planta", Color(0xFF71c558)),
  electric("Eléctrico", Color(0xFFe5c531)),
  psychic("Psíquico", Color(0xFFe5709b)),
  ice("Hielo", Color(0xFF70cbd4)),
  dragon("Dragón", Color(0xFF6a7baf)),
  dark("Siniestro", Color(0xFF736c75)),
  fairy("Hada", Color(0xFFe397d1)),
  stellar("Astral", Color(0xFFB74093));

  const PokemonTypes(this.name, this.color);
  final Color color;
  final String name;

  factory PokemonTypes.fromCode(String code){
    switch (code){
      case "normal":
        return PokemonTypes.normal;
      case "fighting":
        return PokemonTypes.fighting;
      case "flying":
        return PokemonTypes.flying;
      case "poison":
        return PokemonTypes.poison;
      case "ground":
        return PokemonTypes.ground;
      case "rock":
        return PokemonTypes.rock;
      case "bug":
        return PokemonTypes.bug;
      case "ghost":
        return PokemonTypes.ghost;
      case "steel":
        return PokemonTypes.steel;
      case "fire":
        return PokemonTypes.fire;
      case "water":
        return PokemonTypes.water;
      case "grass":
        return PokemonTypes.grass;
      case "electric":
        return PokemonTypes.electric;
      case "psychic":
        return PokemonTypes.psychic;
      case "ice":
        return PokemonTypes.ice;
      case "dragon":
        return PokemonTypes.dragon;
      case "dark":
        return PokemonTypes.dark;
      case "fairy":
        return PokemonTypes.fairy;
      case "stellar":
        return PokemonTypes.stellar;
      default:
        throw Exception("error de tipo");
    }
  }



}