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
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: bubbleDiameter,
              width: bubbleDiameter,
              decoration: bubbleBoxDecoration,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    //child: svg,
                    child: ClipPath(
                      clipper: GraphBubbleClipper(),
                      child: svg,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: bubbleDiameter * 0.17),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('Upper Body', style: labelTextStyle),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('45', style: weightTextStyle),
                  ),
                  const Padding(
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

class GraphBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(
    Size size,
  ) {
    final path = Path();

    path.moveTo(0, 0);

    path.quadraticBezierTo(0, size.height * 0.88, size.width * 0.5, size.height);

    //path.lineTo(size.width * 0.5, size.height);

    path.quadraticBezierTo(size.width * 0.89, size.height * 0.92, size.width * 0.985, size.height * 0.33);

    //path.lineTo(size.width * 0.985, size.height * 0.33);

    path.lineTo(size.width * 0.985, 0);

    return path;
  }

  @override
  bool shouldReclip(GraphBubbleClipper oldClipper) => true;
}
