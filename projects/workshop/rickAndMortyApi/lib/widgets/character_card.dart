import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_list.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, required this.onTap, Key? key})
      : super(key: key);

  final Result character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.amber,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://rickandmortyapi.com/api/character/avatar/${character.id}.jpeg",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                character.name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}