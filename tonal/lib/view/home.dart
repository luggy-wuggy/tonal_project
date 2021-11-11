import 'package:flutter/material.dart';
import 'package:tonal/global/styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: bubbleDiameter,
              width: bubbleDiameter,
              decoration: bubbleBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Upper Body', style: labelTextStyle),
                  Text('45', style: weightTextStyle),
                  Text('lbs', style: unitTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
