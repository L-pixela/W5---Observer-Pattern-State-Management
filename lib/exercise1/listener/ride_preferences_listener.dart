import '../model/ride_pref/ride_pref.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}
