import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_list.dart';
import 'package:rick_and_morty_app/repositories/character_repository.dart';
import 'package:rick_and_morty_app/widgets/app_bar_widget.dart';
import 'package:rick_and_morty_app/widgets/character_card.dart';

class HomePage extends StatefulWidget {
  static const String routeId = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CharacterListModel>? characterList;

  @override
  void initState() {
    characterList = CharacterRepository.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: FutureBuilder(future: characterList, builder: (context, snapshot) {
        if(snapshot.hasData){
          final data = snapshot.data;

          if(data == null) return Text('Nenhum personagem encontrado', style: TextStyle(color: Colors.red));

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              return CharacterCard(
                character: data.results[index],
                onTap: () {

                },
              );
            },
          );
        }
        if (snapshot.hasError) {
        return Text(
          'Erro: ${snapshot.error}',
           style: TextStyle(color: Colors.red),
        );
      }

       return CircularProgressIndicator();
      }),
    );
  }
}