import 'package:geocoding/geocoding.dart';

class LocationModel {
  double? latitude;
  double? longitude;
  Placemark? placemarks;
  LocationModel(
      {required this.latitude,
      required this.longitude,
      required this.placemarks});
}
