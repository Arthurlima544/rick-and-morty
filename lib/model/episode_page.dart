import 'package:rick_and_morty/model/episode.dart';

const itemsPerPage = 20;

class EpisodePage {
  final List<Episode> items;
  final int startingIndex;
  final bool hasNext;

  EpisodePage({
    required this.items,
    required this.startingIndex,
    required this.hasNext,
  });
}
