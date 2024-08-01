import 'package:geocoding/geocoding.dart';

class LocationModel {
  double? lat;
  double? lng;
  Placemark? place;
  LocationModel({required this.lat, required this.lng, required this.place});
}
