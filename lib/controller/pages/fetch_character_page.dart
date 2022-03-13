import 'package:rick_and_morty/controller/services/rick_and_morty/client/dio_client.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/rick_and_morty_service.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';

Future<List<Character>> fetchCharacterPage(Episode episode) async {
  RickAndMortyService service = RickAndMortyService(ClientDio());
  final res = await service.getCharactersInEpisode(episode);
  return res;
}
