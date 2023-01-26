// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

List<PokemonModel> pokemonModelFromJson(String str) => List<PokemonModel>.from(json.decode(str).map((x) => PokemonModel.fromJson(x)));

String pokemonModelToJson(List<PokemonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonModel {
    PokemonModel({
        required this.id,
        required this.num,
        required this.name,
        required this.img,
        required this.type,
    });

    int id;
    String num;
    String name;
    String img;
    List<String> type;

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: json["type"] == null ? [] : List<String>.from(json["type"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
    };
}
