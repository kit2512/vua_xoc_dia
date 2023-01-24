import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vua_xoc_dia/dice_game_controller.dart';
import 'package:vua_xoc_dia/dice_game_page.dart';

void main() {
  Get.put(DiceGameController());
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: DiceGamePage(),
    );
  }
}


