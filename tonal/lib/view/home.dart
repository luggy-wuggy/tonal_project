import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tonal/widgets/bubble.dart';
import 'package:tonal/widgets/label_button.dart';
import 'package:tonal/widgets/weight_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Bubble(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LabelButton(),
                WeightButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
