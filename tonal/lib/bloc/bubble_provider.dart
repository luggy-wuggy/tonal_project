import 'package:flutter/material.dart';
import 'package:tonal/bloc/bubble_bloc.dart';

class BubbleProvider with ChangeNotifier {
  late BubbleBloc _bubbleBloc;

  BubbleProvider() {
    _bubbleBloc = BubbleBloc();
    _bubbleBloc.loadPreferences();
  }

  BubbleBloc get bloc => _bubbleBloc;
}
