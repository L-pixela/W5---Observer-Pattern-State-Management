import 'package:provider_demo/exercise1/repository/mock/mock_ride_preferences_repository.dart';
import 'package:provider_demo/exercise1/service/ride_prefs_service.dart';

import '../dummy_data/dummy_data.dart';
import '../listener/ride_preferences_listener.dart';
import '../model/ride_pref/ride_pref.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference newPreference) {
    print('[ConsoleLogger] Ride preference changed to: $newPreference');
  }
}

void main() {
  // setup the test
  final testPreference1 = fakeRidePrefs[0];
  final testPreference2 = fakeRidePrefs[1];

  // initialize the ride preference service
  RidePrefService.initialize(MockRidePreferencesRepository());
  final service = RidePrefService.instance;

  //Create and register the logger
  ConsoleLogger logger = ConsoleLogger();
  service.addListener(logger);

  // Test preference changes
  print('Testing first preference change:');
  service.setCurrentPreference(testPreference1);

  print("\nTesting second preference change:");
  service.setCurrentPreference(testPreference2);
}
