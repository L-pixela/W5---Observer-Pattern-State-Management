import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations = fakeLocations;

  //static prive instance
  static LocationsService? _instance;

  // Access to past locations
  final LocationsRepository repository;

  Location? _currentLocations;

  ///
  /// Private Constructor
  ///
  LocationsService._internal(this.repository);

  ///
  /// Initialize
  ///
  static void initialize(LocationsRepository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("Already Initialized"); // Already initialized
    }
  }

  ///
  /// Singleton accessor
  ///
  static LocationsService get instance {
    if (_instance == null) {
      throw Exception(
          "RidePreferencesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  // Current preference
  Location? get currentLocations {
    print('Get  current  Locations : $_currentLocations');
    return _currentLocations;
  }

  void setCurrentPreference(Location location) {
    _currentLocations = location;
    print('Set current Locations to $_currentLocations');
  }

  // Locations
  List<Location> getLocations() {
    return repository.getLocations();
  }

  void addLocation(Location location) {
    return repository.addLocations(location);
  }
}
