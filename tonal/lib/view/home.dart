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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Bubble(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff53a99a)),
                  ),
                  child: const Text(
                    'Label',
                    style: labelTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff53a99a)),
                  ),
                  child: const Text(
                    'Weight',
                    style: labelTextStyle,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  const Bubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bubbleDiameter,
      width: bubbleDiameter,
      decoration: bubbleBoxDecoration,
      child: Stack(
        children: [
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: GraphBubbleClipper(),
              child: svg,
            ),
          ),
        ],
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

    path.quadraticBezierTo(0, size.height * 0.88, size.width * 0.5, size.height);
    path.quadraticBezierTo(size.width * 0.89, size.height * 0.92, size.width * 0.985, size.height * 0.33);
    path.lineTo(size.width * 0.985, 0);

    return path;
  }

  @override
  bool shouldReclip(GraphBubbleClipper oldClipper) => true;
}
