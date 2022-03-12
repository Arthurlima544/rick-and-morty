import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/client/dio_client.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/rick_and_morty_service.dart';
import 'package:rick_and_morty/model/episode.dart';

void main() {
  test('Should make a request via Dio client and return all episodes in page 1',
      () async {
    // Arrage
    RickAndMortyService service = RickAndMortyService(ClientDio());
    // Act
    final res = await service.getEpisodes(1);
    // Assert
    expect(res, isA<List<Episode>>());
    expect(res, isNotNull);
  });
}
