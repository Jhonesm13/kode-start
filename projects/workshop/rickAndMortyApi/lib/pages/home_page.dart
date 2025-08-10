import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_list.dart';
import 'package:rick_and_morty_app/pages/details_page.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBarWidget(isHomePage: true),
      body: FutureBuilder(future: characterList, builder: (context, snapshot) {
        if(snapshot.hasData){
          final data = snapshot.data;

          if(data == null) return Text('Nenhum personagem encontrado', style: TextStyle(color: Colors.red));

          return ListView.builder(
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: CharacterCard(
                  character: data.results[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailsPage.routeId,
                      arguments: data.results[index].id,
                    );
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
            return Text(
              'Erro: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            );
          }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}