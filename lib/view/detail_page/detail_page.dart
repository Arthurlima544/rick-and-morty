import 'package:flutter/material.dart';
import 'package:rick_and_morty/controller/pages/detail_page/detail_page_controller.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/view/detail_page/components/caracter_card.dart';
import 'package:rick_and_morty/view/detail_page/components/detail_page_app_bar.dart';

class DetailPage extends StatefulWidget {
  final Episode episode;
  const DetailPage({Key? key, required this.episode}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailPageController controller = DetailPageController();
  @override
  void initState() {
    controller.list.addListener(() {
      setState(() {});
    });
    controller.getCharacteres(widget.episode);
    super.initState();
  }

  @override
  void dispose() {
    controller.list.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(108.0),
        child: DetailPageAppBar(episode: widget.episode),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.list,
        builder: (context, List<Character> value, child) {
          if (value.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.font,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return CaracterCard(
                character: value[index],
              );
            },
            itemCount: widget.episode.characteres.length,
          );
        },
      ),
    );
  }
}
