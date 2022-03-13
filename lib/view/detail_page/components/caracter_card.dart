import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/app_colors.dart';

class CaracterCard extends StatelessWidget {
  const CaracterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        top: 40,
      ),
      child: Container(
        color: AppColors.secondary,
        height: 104,
        width: MediaQuery.of(context).size.width - 37,
        child: Row(
          children: [
            const SizedBox(
              height: 104,
              width: 84,
            ),
            Flexible(
              child: Container(),
            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "episode",
                        style: const TextStyle(
                            color: AppColors.font, fontSize: 13),
                      ),
                      Text(
                        "episode",
                        style: const TextStyle(
                            color: AppColors.font, fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "episode",
                        style: const TextStyle(
                            color: AppColors.font, fontSize: 13),
                      ),
                      Text(
                        "episode",
                        style: const TextStyle(
                            color: AppColors.font, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
