import 'package:rick_and_morty/controller/services/rick_and_morty/interface/http_client_interface.dart';
import 'package:rick_and_morty/model/episode.dart';

const baseUrl = "https://rickandmortyapi.com/api/";

class RickAndMortyService {
  final HttpClientInterface client;

  RickAndMortyService(this.client);

  Future<List<Episode>> getEpisodes(int page) async {
    // <List<Episode>>
    var response = await client.get("$baseUrl/episode?page=$page");
    var body = (response.data as Map<String, dynamic>);
    var json = body["results"] as List;
    List<Episode> listEpisodes = json.map((e) {
      return Episode.fromJson(e);
    }).toList();
    return listEpisodes;
  }
}
