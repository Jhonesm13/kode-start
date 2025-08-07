import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/models/character_list.dart';

class CharacterRepository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
      )
  );

  static Future<CharacterListModel> getCharacters() async {
    final response = await _dio.get('/character');
    return CharacterListModel.fromMap(response.data);
  }
}