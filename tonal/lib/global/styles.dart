import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double bubbleDiameter = 272;

String assetName = 'assets/graph.svg';
Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'graph bubble',
);

const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  letterSpacing: -10,
  fontFamily: 'League Gothic',
  fontSize: 127,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

const unitTextStyle = TextStyle(
  letterSpacing: -2,
  fontFamily: 'League Gothic',
  fontSize: 38,
  fontWeight: FontWeight.w500,
  color: Color(0x80ffffff),
);

const scrollItemTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: Colors.white,
);
