import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/controller/pages/home_page/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(103.0),
        child: Container(
          color: Colors.black26,
          alignment: Alignment.center,
          child: const Text(
            "Rick and Morty",
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
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(episode.name),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(episode.name), Text("${episode.id}")],
                    ),
                  );
                },
              )),
    );
  }
}
