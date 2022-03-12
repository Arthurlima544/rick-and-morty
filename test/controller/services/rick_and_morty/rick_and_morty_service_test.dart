import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/client/dio_client.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/rick_and_morty_service.dart';
import 'package:rick_and_morty/model/episode.dart';

void main() {
  const firstEpisode = Episode(
      id: 1,
      name: "Pilot",
      airDate: "December 2, 2013",
      episode: "S01E01",
      characteres: [
        "https://rickandmortyapi.com/api/character/1",
        "https://rickandmortyapi.com/api/character/2",
        "https://rickandmortyapi.com/api/character/35",
        "https://rickandmortyapi.com/api/character/38",
        "https://rickandmortyapi.com/api/character/62",
        "https://rickandmortyapi.com/api/character/92",
        "https://rickandmortyapi.com/api/character/127",
        "https://rickandmortyapi.com/api/character/144",
        "https://rickandmortyapi.com/api/character/158",
        "https://rickandmortyapi.com/api/character/175",
        "https://rickandmortyapi.com/api/character/179",
        "https://rickandmortyapi.com/api/character/181",
        "https://rickandmortyapi.com/api/character/239",
        "https://rickandmortyapi.com/api/character/249",
        "https://rickandmortyapi.com/api/character/271",
        "https://rickandmortyapi.com/api/character/338",
        "https://rickandmortyapi.com/api/character/394",
        "https://rickandmortyapi.com/api/character/395",
        "https://rickandmortyapi.com/api/character/435"
      ],
      created: "2017-11-10T12:56:33.798Z");
  test('Should make a request via Dio client and return all episodes in page 1',
      () async {
    // Arrage
    RickAndMortyService service = RickAndMortyService(ClientDio());
    // Act
    final res = await service.getEpisodes(1);
    // Assert
    expect(res, isA<List<Episode>>());
    expect(res[0], equals(firstEpisode));
  });
}
