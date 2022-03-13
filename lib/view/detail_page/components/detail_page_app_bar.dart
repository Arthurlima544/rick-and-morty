import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/utils/app_colors.dart';

class DetailPageAppBar extends StatelessWidget {
  final Episode episode;
  const DetailPageAppBar({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
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
          ),
          Flexible(
            flex: 2,
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
