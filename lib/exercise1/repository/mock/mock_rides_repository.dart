import '../../model/ride/locations.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../model/user/user.dart';
import '../../service/rides_service.dart';
import '../rides_repository.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _rides = [
    Ride(
        departureLocation: Location(name: "Battambang", country: Country.kh),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "Siem Reap", country: Country.kh),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(
            firstName: "Kannika",
            lastName: "Kan",
            email: "kannika@gmail.com",
            phone: "012 331 245",
            profilePicture: "",
            verifiedProfile: true),
        availableSeats: 2,
        pricePerSeat: 15,
        acceptsPets: false),
    Ride(
        departureLocation: Location(name: "Battambang", country: Country.kh),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "Siem Reap", country: Country.kh),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(
            firstName: "Chaylim",
            lastName: "Cheng",
            email: "chaylim@gmail.com",
            phone: "012 212 123",
            profilePicture: "",
            verifiedProfile: true),
        availableSeats: 0,
        pricePerSeat: 15,
        acceptsPets: false),
    Ride(
        departureLocation: Location(name: "Battambang", country: Country.kh),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "Siem Reap", country: Country.kh),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: User(
            firstName: "Mengtech",
            lastName: "Hout",
            email: "Mengtech@gmail.com",
            phone: "023 123 523",
            profilePicture: "",
            verifiedProfile: true),
        availableSeats: 1,
        pricePerSeat: 15,
        acceptsPets: false),
    Ride(
        departureLocation: Location(name: "Battambang", country: Country.kh),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "Siem Reap", country: Country.kh),
        arrivalDateTime: DateTime.now().add(Duration(hours: 2)),
        driver: User(
            firstName: "Limhao",
            lastName: "Hong",
            email: "Limhao@gmail.com",
            phone: "012 854 165",
            profilePicture: "",
            verifiedProfile: true),
        availableSeats: 2,
        pricePerSeat: 15,
        acceptsPets: true),
    Ride(
        departureLocation: Location(name: "Battambang", country: Country.kh),
        departureDate: DateTime.now(),
        arrivalLocation: Location(name: "Siem Reap", country: Country.kh),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: User(
            firstName: "Sovanda",
            lastName: "Sok",
            email: "Sovanda@gmail.com",
            phone: "093 213 1267",
            profilePicture: "",
            verifiedProfile: true),
        availableSeats: 1,
        pricePerSeat: 15,
        acceptsPets: false),
  ];

  @override
  List<Ride> getRides(
      RidePreference preferences, RideFilter? filter, RideSortType? sortType) {
    return _rides.where((ride) {
      bool matchesPreference =
          ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival;

      // Pet filter
      final petMatch = filter?.acceptPet == null
          ? true
          : ride.acceptsPets == filter!.acceptPet;

      return matchesPreference && petMatch;
    }).toList();
  }

  @override
  void addRides(Ride ride) {
    _rides.add(ride);
  }
}
