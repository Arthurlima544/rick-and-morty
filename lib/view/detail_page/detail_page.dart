import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/view/detail_page/components/caracter_card.dart';

class DetailPage extends StatelessWidget {
  final Episode episode;
  const DetailPage({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(108.0),
        child: Column(
          children: [
            Container(
              height: 70,
              color: AppColors.secondary,
              child: Row(
                children: [
                  const BackButton(),
                  Flexible(
                    child: Container(),
                  ),
                  Flexible(
                    flex: 6,
                    child: Text(
                      "Ep - ${episode.name}",
                      textAlign: TextAlign.left,
                      style:
                          const TextStyle(color: AppColors.font, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 38,
              color: AppColors.forLayer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    episode.episode,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppColors.primary, fontSize: 15),
                  ),
                  Text(
                    episode.airDate,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppColors.primary, fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CaracterCard();
        },
        itemCount: episode.characteres.length,
      ),
    );
  }
}
