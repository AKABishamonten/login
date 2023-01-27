import 'package:flutter/material.dart';
import 'package:loginfuc/login_fuction/authen_fuction.dart';
import 'package:loginfuc/models/model.dart';
import 'package:loginfuc/view_model/todo_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    PokemonViewModel pokemonViewModel = context.watch<PokemonViewModel>();
    print(toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<Authenfuction>().signOut(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: ListView.builder(
        itemCount: pokemonViewModel.pokemonModel.length,
        itemBuilder: (context, index) {
          PokemonModel pokemonModel = pokemonViewModel.pokemonModel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(pokemonModel.img,height:100,width: 100,fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pokemonModel.name),
                        const SizedBox(height: 10,),
                        Text(pokemonModel.num),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ]
              )
            )
          );
        }
      ),
    );
  }
}

/*
      body: ListView.builder(
        itemCount: todoViewModel.todoModel.length,
        itemBuilder: (context, index){
        TodoModel todoModel = todoViewModel.todoModel[index];
        return Container(
          child: Text(todoModel.name),
        );
      }),
    );
  }
}

 */
