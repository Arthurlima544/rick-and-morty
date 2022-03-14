import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rick_and_morty/main.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/view/detail_page/components/caracter_card.dart';
import 'package:rick_and_morty/view/detail_page/detail_page.dart';
import 'package:rick_and_morty/view/home_page/components/episode_card.dart';
import 'package:rick_and_morty/view/home_page/home_page.dart';

void main() {
  group('Integration Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    testWidgets(
        'Deve carregar a HomePage com episodios e permitir a rolagem dos itens para baixo, obtendo episode cards e não quebrando ao final da lista',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(EpisodeCard), findsWidgets);

      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);

      await tester.fling(find.byType(ListView), const Offset(0, -2000), 90000);
      await tester.pumpAndSettle();

      expect(find.byType(EpisodeCard), findsWidgets);
    });

    testWidgets(
        'Deve Carregar a HomePage com episodios e permitir a rolagem dos itens para cima, obtendo  episode cards e não quebrando ao final da lista',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(EpisodeCard), findsWidgets);

      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);

      await tester.fling(find.byType(ListView), const Offset(0, -2000), 90000);
      await tester.pumpAndSettle();

      await tester.fling(find.byType(ListView), const Offset(0, 2000), 90000);
      await tester.pumpAndSettle();

      expect(find.byType(EpisodeCard), findsWidgets);
    });

    testWidgets(
        'Deve clicar em um episodio , ser enviado para details page e mostrar primeiro character. ',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: DetailPage(
          episode: firstEpisode,
        ),
      ));

      await tester.pumpAndSettle();

      expect(find.text("Rick Sanchez"), findsOneWidget);

      await tester.fling(find.byType(ListView), const Offset(0, -2000), 9000);
      await tester.pumpAndSettle();

      expect(find.byType(CaracterCard), findsWidgets);
    });
  });
}

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
