import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/repository/mock/mock_ride_preferences_repository.dart';
import '../model/ride/ride_pref.dart';
import '../repository/ride_preferences_repository.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];
  final RidePreferencesRepository repository;

  RidesPreferencesProvider({required this.repository}) {
    // For now past preferences are fetched only 1 time
    _pastPreferences = repository.getPastPreferences();
  }

  RidePreference? get currentPreference => _currentPreference;
  void setCurrentPreferrence(RidePreference pref) {
    // 1- We process only if the new preference is not equal to the current one
    if (_currentPreference != pref) {
      // 2- We first update the current preference
      _currentPreference = pref;
      print('Set current pref : $_currentPreference');

      // 3- We then update the history All preferences in history shall be exclusive (different) !
      repository.addPreference(pref);
      print('Add pref to history : $_currentPreference');

      // 4- We finally notify the listeners
      notifyListeners();
    }
  }

  void _addPreference(RidePreference preference) {
    // new preference must not in _pastPreferences
    if (!_pastPreferences.contains(preference)) {
      _pastPreferences.add(preference);
      print('Add pref to history : $_currentPreference');
      notifyListeners();
    }
  }

  // History is returned from newest to oldest preference
  List<RidePreference> get preferencesHistory =>
      _pastPreferences.reversed.toList();
}
