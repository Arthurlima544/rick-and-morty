import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/utils/app_colors.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        top: 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          border: Border.all(width: 10, color: AppColors.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 104,
        width: MediaQuery.of(context).size.width - 37,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              episode.name,
              style: const TextStyle(color: AppColors.font, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  episode.episode,
                  style: const TextStyle(color: AppColors.font, fontSize: 13),
                ),
                Text(
                  episode.airDate,
                  style: const TextStyle(color: AppColors.font, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
