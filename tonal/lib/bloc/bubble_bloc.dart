import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A BloC unit used for one specific Bubble ui widget. \
/// Contains two BehaviorSubject streams to update the \
/// state of the label string and weight string
class BubbleBloc {
  final String prefLabel = 'label';
  final String prefWeight = 'weight';
  final String initialLabel = 'Upper Body';
  final String initialWeight = '45';

  final _subjectLabelDisplay = BehaviorSubject<String>();
  final _subjectWeightDisplay = BehaviorSubject<String>();

  /// GETTERS
  Stream<String> get labelObservable => _subjectLabelDisplay.stream;
  Stream<String> get weightObservable => _subjectWeightDisplay.stream;

  /// Fetch shared preferences cache in the start of BloC instantiation
  /// whether there are persistent values for label and weightvalues
  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? label = prefs.getString(prefLabel);
    String? weight = prefs.getString(prefWeight);

    label != null ? _subjectLabelDisplay.value = label : _subjectLabelDisplay.value = initialLabel;
    weight != null ? _subjectWeightDisplay.value = weight : _subjectWeightDisplay.value = initialWeight;
  }

  /// Set the label value and save it into shared preferences cache
  void setLabel(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _subjectLabelDisplay.value = s;
    await prefs.setString(prefLabel, s);
  }

  /// Set the weight value and save it into shared preferences cache
  void setWeight(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _subjectWeightDisplay.value = s;
    await prefs.setString(prefWeight, s);
  }

  void dispose() {
    _subjectLabelDisplay.close();
    _subjectWeightDisplay.close();
  }
}
