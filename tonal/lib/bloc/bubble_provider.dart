import 'package:flutter/material.dart';
import 'package:tonal/bloc/bubble_bloc.dart';

/// Provider for the BubbleBloC in order to inject on top of widget tree, \
/// for access to the state/functionality of the BloC down it's children.
class BubbleProvider with ChangeNotifier {
  late BubbleBloc _bubbleBloc;

  BubbleProvider() {
    _bubbleBloc = BubbleBloc();
    _bubbleBloc.loadPreferences();
  }

  BubbleBloc get bloc => _bubbleBloc;
}
