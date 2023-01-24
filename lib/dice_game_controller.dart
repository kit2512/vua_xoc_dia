import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceGameController extends GetxController with GetSingleTickerProviderStateMixin {

  RxList<int> diceFaces = [1,1,1].obs;
  RxInt numberOfDices = 3.obs;

  late final AnimationController animationController;
  late final Animation<double> animation;

  final random = Random(DateTime.now().millisecondsSinceEpoch);

  void startRolling() async {
    if (animationController.isCompleted) {
      await animationController.reverse();
    }
    diceFaces.value = List<int>.generate(numberOfDices.value, (index) => random.nextInt(5) + 1);
  }


  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    animation = animationController.drive(Tween<double>(begin: 0.0, end: 120));

    startRolling();
    super.onInit();
  }

  void toggleShowingPlate() {
    if (animationController.isCompleted) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  void setNumberOfDices(int? value) {
    numberOfDices.value = value ?? 3;
    startRolling();
  }
}