import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonal/bloc/bubble_bloc.dart';
import 'package:tonal/bloc/bubble_provider.dart';
import 'package:tonal/global/styles.dart';

class Bubble extends StatefulWidget {
  const Bubble({
    Key? key,
  }) : super(key: key);

  @override
  State<Bubble> createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  late BubbleBloc _bubbleBloc;

  @override
  Widget build(BuildContext context) {
    _bubbleBloc = Provider.of<BubbleProvider>(context).bloc;

    return Container(
      height: bubbleDiameter,
      width: bubbleDiameter,
      decoration: bubbleBoxDecoration,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: bubbleDiameter * 0.17),
            child: Align(
              alignment: Alignment.topCenter,
              child: StreamBuilder<Object>(
                stream: _bubbleBloc.labelObservable,
                builder: (context, snapshot) {
                  return Text('${snapshot.data}', style: labelTextStyle);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Object>(
              stream: _bubbleBloc.weightObservable,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: weightTextStyle,
                );
              },
            ),
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
