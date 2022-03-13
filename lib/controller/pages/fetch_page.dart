import 'dart:math' as math;
import 'package:rick_and_morty/controller/services/rick_and_morty/client/dio_client.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/rick_and_morty_service.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/episode_page.dart';

const totalItensLength = 300;
int page = 1;

Future<EpisodePage> fetchEpisodePage(int startingIndex) async {
  RickAndMortyService service = RickAndMortyService(ClientDio());

  if (startingIndex > 20) {
    page++;
  }

  final res = await service.getEpisodes(page);

  if (startingIndex > totalItensLength) {
    return EpisodePage(
      items: [],
      startingIndex: startingIndex,
      hasNext: false,
    );
  }

  return EpisodePage(
      items: List.generate(
          math.min(itemsPerPage, totalItensLength - startingIndex),
          (index) => Episode(
                id: startingIndex + index,
                name: res[index].name,
                airDate: res[index].airDate,
                episode: res[index].episode,
                characteres: res[index].characteres,
                created: res[index].created,
              )),
      startingIndex: startingIndex,
      hasNext: startingIndex + itemsPerPage < totalItensLength);
}
