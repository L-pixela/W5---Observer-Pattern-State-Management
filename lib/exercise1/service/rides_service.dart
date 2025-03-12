import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../repository/mock/mock_rides_repository.dart';
import '../repository/rides_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides;
  //
  static RidesService? _instance;
  //
  final RidesRepository repository;

  ///
  /// Private constructor
  ///
  RidesService._internal(this.repository);

  ///
  /// Initialize
  ///
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("The Ride is already initialized.");
    }
  }

  ///
  /// Singleton accessor
  ///
  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "RideService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePreference preferences) {
    // For now, just a test
    return availableRides
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival)
        .toList();
  }

  ///
  /// Return the Rides that just Updated witht the filtered
  ///
  List<Ride> getRides(
      RidePreference preferences, RideFilter? filter, RideSortType? sort) {
    return MockRidesRepository().getRides(preferences, filter, sort);
  }

  // To add new rides
  void addRides(Ride ride) {
    MockRidesRepository().addRides(ride);
  }

  List<Ride> applySort(List<Ride> rides, RideSortType? sortType) {
    if (sortType == null) return rides;
    return [...rides]..sort((a, b) {
        switch (sortType) {
          case RideSortType.departureTimeAscending:
            return a.departureDate.compareTo(b.departureDate);
          case RideSortType.priceAscending:
            return a.pricePerSeat.compareTo(b.pricePerSeat);
        }
      });
  }
}

/// For Sorting the Type of Ride
enum RideSortType {
  /// Sort by departure time
  departureTimeAscending("Earliest Depature"),
  priceAscending("Lowest Price");

  final String label;
  const RideSortType(this.label);
}

/// For filtering te Type of Ride
class RideFilter {
  final bool acceptPet;

  RideFilter({this.acceptPet = false});

  RideFilter copyWith({bool? acceptPet}) {
    return RideFilter(
      acceptPet: acceptPet ?? this.acceptPet,
    );
  }
}
