import 'package:flutter_pokedex/ui/helpers/constants.dart';

class Pokemon {
    List<Ability>? abilities;
    int? baseExperience;
    List<Species>? forms;
    int? height;
    List<dynamic>? heldItems;
    int? id;
    bool? isDefault;
    String? locationAreaEncounters;
    List<Move>? moves;
    String? name;
    int? order;
    List<dynamic>? pastAbilities;
    List<dynamic>? pastTypes;
    Species? species;
    Sprites? sprites;
    List<Stat>? stats;
    List<Type>? types;
    int? weight;
    bool? captured;

    Pokemon({
        this.abilities,
        this.baseExperience,
        this.forms,
        this.height,
        this.heldItems,
        this.id,
        this.isDefault,
        this.locationAreaEncounters,
        this.moves,
        this.name,
        this.order,
        this.pastAbilities,
        this.pastTypes,
        this.species,
        this.sprites,
        this.stats,
        this.types,
        this.weight,
        this.captured
    });
    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null ? [] : List<Species>.from(json["forms"]!.map((x) => Species.fromJson(x))),
        height: json["height"],
        heldItems: json["held_items"] == null ? [] : List<dynamic>.from(json["held_items"]!.map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null ? [] : List<Move>.from(json["moves"]!.map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: json["past_abilities"] == null ? [] : List<dynamic>.from(json["past_abilities"]!.map((x) => x)),
        pastTypes: json["past_types"] == null ? [] : List<dynamic>.from(json["past_types"]!.map((x) => x)),
        species: json["species"] == null ? null : Species.fromJson(json["species"]),
        sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null ? [] : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
        weight: json["weight"],
        captured: false
    );
  Pokemon copyWith({
        List<Ability>? abilities,
        int? baseExperience,
        List<Species>? forms,
        int? height,
        List<dynamic>? heldItems,
        int? id,
        bool? isDefault,
        String? locationAreaEncounters,
        List<Move>? moves,
        String? name,
        int? order,
        List<dynamic>? pastAbilities,
        List<dynamic>? pastTypes,
        Species? species,
        Sprites? sprites,
        List<Stat>? stats,
        List<Type>? types,
        int? weight,
        bool? captured
    }) => 
        Pokemon(
            abilities: abilities ?? this.abilities,
            baseExperience: baseExperience ?? this.baseExperience,
            forms: forms ?? this.forms,
            height: height ?? this.height,
            heldItems: heldItems ?? this.heldItems,
            id: id ?? this.id,
            isDefault: isDefault ?? this.isDefault,
            locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
            moves: moves ?? this.moves,
            name: name ?? this.name,
            order: order ?? this.order,
            pastAbilities: pastAbilities ?? this.pastAbilities,
            pastTypes: pastTypes ?? this.pastTypes,
            species: species ?? this.species,
            sprites: sprites ?? this.sprites,
            stats: stats ?? this.stats,
            types: types ?? this.types,
            weight: weight ?? this.weight,
            captured: captured ?? this.captured
        );

}

class Ability {
    Species? ability;
    bool? isHidden;
    int? slot;

    Ability({
        this.ability,
        this.isHidden,
        this.slot,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: json["ability"] == null ? null : Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );
}

class Species {
    String? name;
    String? url;
    
    Species({
        this.name,
        this.url

    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Other {

    Home? home;
    OfficialArtwork? officialArtwork;
    Sprites? showdown;

    Other({
        this.home,
        this.officialArtwork,
        this.showdown,
    });

    factory Other.fromJson(Map<String, dynamic> json) => Other(

        home: json["home"] == null ? null : Home.fromJson(json["home"]),
        officialArtwork: json["official-artwork"] == null ? null : OfficialArtwork.fromJson(json["official-artwork"]),
        showdown: json["showdown"] == null ? null : Sprites.fromJson(json["showdown"]),
    );

}

class Home {
    String? frontDefault;
    dynamic frontFemale;
    String? frontShiny;
    dynamic frontShinyFemale;

    Home({
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );
}


class Move {
    Species? move;

    Move({
        this.move,
    });

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromJson(json["move"]),
    );

}



class Sprites {
    String? backDefault;
    dynamic backFemale;
    String? backShiny;
    dynamic backShinyFemale;
    String? frontDefault;
    dynamic frontFemale;
    String? frontShiny;
    dynamic frontShinyFemale;
    Other? other;

    Sprites? animated;

    Sprites({
        this.backDefault,
        this.backFemale,
        this.backShiny,
        this.backShinyFemale,
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
        this.other,
        this.animated,
    });

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );

}

class OfficialArtwork {
    String? frontDefault;
    String? frontShiny;

    OfficialArtwork({
        this.frontDefault,
        this.frontShiny,
    });

    factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );
}

class Stat {
    int? baseStat;
    int? effort;
    Species? stat;

    Stat({
        this.baseStat,
        this.effort,
        this.stat,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
    );
}

class Type {
    int? slot;
    PokemonTypes? type;

    Type({
        this.slot,
        this.type,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null :  PokemonTypes.fromCode(json["type"]["name"]),
    );
}
