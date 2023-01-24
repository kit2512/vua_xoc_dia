import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vua_xoc_dia/dice_game_controller.dart';

class DiceGamePage extends GetView<DiceGameController> {
  const DiceGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vua Xóc Đĩa"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/chieu.jpeg",
            fit: BoxFit.fitHeight,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        "assets/plate.png",
                        width: 250,
                      ),
                      SizedBox(
                        width: 120,
                        child: Obx(
                          () => Wrap(
                            runSpacing: 12,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            spacing: 12,
                            children: controller.diceFaces
                                .map((face) => ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "assets/dice_$face.png",
                                        width: 50,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: AnimatedBuilder(
                          animation: controller.animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                controller.animation.value,
                                -controller.animation.value,
                              ),
                              child: child,
                            );
                          },
                          child: Draggable(
                            childWhenDragging: Container(),
                            feedback: Image.asset(
                              "assets/bowl.png",
                              width: 210,
                            ),
                            child: Image.asset("assets/bowl.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: controller.startRolling,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            "assets/scroll_placeholder.png",
                            width: 150,
                          ),
                          const Text("Bắt đầu")
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.toggleShowingPlate,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            "assets/scroll_placeholder.png",
                            width: 150,
                          ),
                          const Text("Ẩn/Hiện đĩa")
                        ],
                      ),
                    )
                  ],
                ),
                DropdownButton(
                    icon: Obx(
                      () => Text(
                          "Số lượng súc sắc: ${controller.numberOfDices.value}",
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("1"),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text("2"),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text("3"),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text("4"),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text("5"),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text("6"),
                      ),
                    ],
                    onChanged: controller.setNumberOfDices)
              ],
            ),
          )
        ],
      ),
    );
  }
}
