import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/controller/pages/home_page/home_page_controller.dart';
import 'package:rick_and_morty/view/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<HomePageController>(
        create: (context) => HomePageController(),
        child: const HomePage(),
      ),
    );
  }
}
