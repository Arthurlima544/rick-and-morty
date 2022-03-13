import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/controller/pages/home_page/home_page_controller.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/view/detail_page/detail_page.dart';
import 'package:rick_and_morty/view/home_page/components/episode_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          color: AppColors.secondary,
          alignment: Alignment.center,
          child: const Text(
            "Rick and Morty Episodes",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.font, fontSize: 18),
          ),
        ),
      ),
      body: Selector<HomePageController, int?>(
          selector: (context, controller) => controller.pagesLenght,
          builder: (context, itemCount, child) => ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  var pagesProvider = Provider.of<HomePageController>(context);

                  var episode = pagesProvider.getByIndex(index);
                  if (episode.isLoading) {
                    return EpisodeCard(episode: episode);
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DetailPage(episode: episode);
                      }));
                    },
                    child: EpisodeCard(episode: episode),
                  );
                },
              )),
    );
  }
}
