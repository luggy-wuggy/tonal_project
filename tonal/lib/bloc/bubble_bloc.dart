import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BubbleBloc {
  String initialLabel = 'Upper Body';
  String initialWeight = '45';

  final _subjectLabelDisplay = BehaviorSubject<String>();
  final _subjectWeightDisplay = BehaviorSubject<String>();

  /// GETTERS
  Stream<String> get labelObservable => _subjectLabelDisplay.stream;
  Stream<String> get weightObservable => _subjectWeightDisplay.stream;

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? label = prefs.getString('label');
    String? weight = prefs.getString('weight');

    label != null ? _subjectLabelDisplay.sink.add(label) : _subjectLabelDisplay.sink.add(initialLabel);
    weight != null ? _subjectWeightDisplay.sink.add(weight) : _subjectWeightDisplay.sink.add(initialWeight);
  }

  void setLabel(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _subjectLabelDisplay.value = s;
    await prefs.setString('label', s);
  }

  void setWeight(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _subjectWeightDisplay.value = s;
    await prefs.setString('weight', s);
  }

  void dispose() {
    _subjectLabelDisplay.close();
    _subjectWeightDisplay.close();
  }
}
