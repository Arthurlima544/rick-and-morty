import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/utils/app_colors.dart';

class CaracterCard extends StatelessWidget {
  final Character character;
  const CaracterCard({Key? key, required this.character}) : super(key: key);

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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                height: 104,
                image: NetworkImage(character.urlImage),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  Flexible(
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      character.name,
                      overflow: TextOverflow.clip,
                      style:
                          const TextStyle(color: AppColors.font, fontSize: 18),
                    ),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${character.status} - ${character.gender}",
                      style:
                          const TextStyle(color: AppColors.font, fontSize: 13),
                    ),
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
