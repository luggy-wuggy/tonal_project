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
              child: Stack(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: bubbleDiameter * 0.17),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('Upper Body', style: labelTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('45', style: weightTextStyle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bubbleDiameter * 0.1),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('lbs', style: unitTextStyle),
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
