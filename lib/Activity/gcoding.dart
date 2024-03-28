import 'package:geocoding/geocoding.dart';

Future<void> main() async {
  try {
    double latitude = 37.422;
    double longitude = -122.084;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      print(
          "Address: ${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}");
    } else {
      print(
          "No placemarks found for the coordinates: Latitude: $latitude, Longitude: $longitude");
    }
  } catch (e) {
    print("Error occurred while reverse geocoding: $e");
  }
}
