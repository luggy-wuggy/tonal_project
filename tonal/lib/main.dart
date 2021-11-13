import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tonal/bloc/bubble_provider.dart';
import 'package:tonal/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BubbleProvider>(
      create: (context) => BubbleProvider(),
      child: MaterialApp(
        title: 'Tonal Widget Challenge',
        theme: ThemeData(),
        home: const Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
