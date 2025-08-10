// character_repository.dart
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/models/character_list.dart';

class CharacterRepository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  );

  static Future<CharacterListModel> getCharacters() async {
    final response = await _dio.get('/character?page=2');
    return CharacterListModel.fromMap(response.data);
  }

  static Future<Result> getDetailedCharacterWithFirstEpisodeName(int characterId) async {
    final characterResponse = await _dio.get("/character/$characterId");
    final character = Result.fromMap(characterResponse.data);

    if (character.episode.isNotEmpty) {
      try {
        final episodeUrl = character.episode.first;
        final episodeResponse = await _dio.get(episodeUrl);
        character.firstEpisodeName = episodeResponse.data['name'];
      } catch (e) {
        character.firstEpisodeName = 'Erro ao carregar';
      }
    }

    return character;
  }
}