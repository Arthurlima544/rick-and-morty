import 'package:flutter/material.dart';
import 'package:rick_and_morty/controller/pages/fetch_character_page.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';

class DetailPageController {
  Map<int, Character> characters = {};
  ValueNotifier<List<Character>> list = ValueNotifier([]);

  void getCharacteres(Episode episode) async {
    final aux = await fetchCharacterPage(episode);
    list.value = aux;
  }
}
