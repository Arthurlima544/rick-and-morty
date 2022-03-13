import 'package:flutter/material.dart';
import 'package:rick_and_morty/controller/pages/fetch_page.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/episode_page.dart';

class HomePageController extends ChangeNotifier {
  static const maxCacheLenght = 100;
  final Map<int, EpisodePage> _pages = {};
  final Set<int> _pagesBeingFetched = {};
  int? pagesLenght;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  // Verifica se é necessário gerar novas páginas e retira páginas do cache muito distantes.
  Future<void> _fetchPage(int startingIndex) async {
    if (_pagesBeingFetched.contains(startingIndex)) {
      return;
    }

    _pagesBeingFetched.add(startingIndex);
    final page = await fetchEpisodePage(startingIndex);
    _pagesBeingFetched.remove(startingIndex);

    if (!page.hasNext) {
      pagesLenght = page.items.length + startingIndex;
    }

    _pages[startingIndex] = page;

    _cleanCache(startingIndex);

    if (!_isDisposed) {
      notifyListeners();
    }
    //
  }

  // Controla o inicio de cada página sempre atualizando seu inicio e retornando cada episódio.
  Episode getByIndex(int index) {
    var startingIndex = (index ~/ itemsPerPage) * itemsPerPage;

    if (_pages.containsKey(startingIndex)) {
      var item = _pages[startingIndex]!.items[index - startingIndex];
      return item;
    }

    _fetchPage(startingIndex);
    return Episode.loading();
  }

  // Limpa episodeos armazenados que ultrapasssam do tamanho de cache
  void _cleanCache(int currentStartingIndex) {
    final keysToRemove = <int>{};

    for (final key in _pages.keys) {
      if ((key - currentStartingIndex).abs() > maxCacheLenght) {
        keysToRemove.add(key);
      }
    }
    for (final key in keysToRemove) {
      _pages.remove(key);
    }
  }
}
