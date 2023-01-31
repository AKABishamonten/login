import 'package:flutter/material.dart';
import 'package:loginfuc/helpes/api_status.dart';
import 'package:loginfuc/models/model.dart';
import 'package:loginfuc/services/service.dart';

class PokemonViewModel extends ChangeNotifier{
  List<PokemonModel> _pokemonModel = [];

  List<PokemonModel> get pokemonModel => _pokemonModel;

  setPokemonModel(List<PokemonModel> pokemonModel){
    _pokemonModel = pokemonModel;
    notifyListeners();
  }

  PokemonViewModel() {
    getPokemonList();
  }

  getPokemonList() async {
    final response = await PokemonService.getPokemonList();
    if(response is Success){
      setPokemonModel(response.response as List<PokemonModel>);
    }else{
      print("Failure Response");
    }
  }
}