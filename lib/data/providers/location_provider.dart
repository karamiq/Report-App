import 'package:app/data/providers/location_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/location_model.dart';

class LocationNotifier extends StateNotifier<LocationModel?> {
  LocationNotifier() : super(null) {
    _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final latitude = prefs.getDouble('latitude');
      final longitude = prefs.getDouble('longitude');

      if (latitude != null && longitude != null) {
        final placemarks = await convertToAddress(latitude, longitude);
        state = LocationModel(
          lat: latitude,
          lng: longitude,
          place: placemarks,
        );
      } else {
        state = null;
      }
    } catch (e) {
      state = null;
    }
  }

  Future<bool> getCurrentLocation() async {
    final location = Location();

    try {
      if (!await _checkAndRequestService(location)) return false;
      if (!await _checkAndRequestPermission()) return false;
      final locationData = await location.getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        final latitude = locationData.latitude!;
        final longitude = locationData.longitude!;
        final placemarks = await convertToAddress(latitude, longitude);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setDouble('latitude', latitude);
        await prefs.setDouble('longitude', longitude);

        state = LocationModel(
          lat: latitude,
          lng: longitude,
          place: placemarks,
        );
        return true; // success
      } else {
        state = null;
        return false; // failure
      }
    } catch (e) {
      state = null;
      return false; // failure
    }
  }

  Future<void> removeLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('latitude');
      await prefs.remove('longitude');

      state = null;
    } catch (e) {}
  }

  Future<bool> _checkAndRequestService(Location location) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      print('Location service not enabled');
      state = null;
    }
    return serviceEnabled;
  }

  Future<bool> _checkAndRequestPermission() async {
    final status = await Permission.location.status;

    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    } else {
      return status.isGranted;
    }
  }
}

final locationProvider =
    StateNotifierProvider<LocationNotifier, LocationModel?>((ref) {
  return LocationNotifier();
});


/*

import 'package:app/data/providers/location_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/location_model.dart';

class LocationNotifier extends StateNotifier<LocationModel?> {
  LocationNotifier() : super(null) {
    _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final latitude = prefs.getDouble('latitude');
      final longitude = prefs.getDouble('longitude');

      if (latitude != null && longitude != null) {
        final placemarks = await convertToAddress(latitude, longitude);
        state = LocationModel(
          latitude: latitude,
          longitude: longitude,
          placemarks: placemarks,
        );
      }
    } catch (e) {
      state = null;
    }
  }

  Future<void> getCurrentLocation() async {
    final location = Location();

    try {
      if (!await _checkAndRequestService(location)) return;
      if (!await _checkAndRequestPermission(location)) return;

      final locationData = await location.getLocation();
      final latitude = locationData.latitude!;
      final longitude = locationData.longitude!;
      final placemarks = await convertToAddress(latitude, longitude);

      // Save the location in shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('latitude', latitude);
      await prefs.setDouble('longitude', longitude);

      state = LocationModel(
        latitude: latitude,
        longitude: longitude,
        placemarks: placemarks,
      );
    } catch (e) {
      state = null;
    }
  }

  Future<bool> _checkAndRequestService(Location location) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      state = null;
    }
    return serviceEnabled;
  }

  Future<bool> _checkAndRequestPermission(Location location) async {
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    if (permissionGranted != PermissionStatus.granted) {
      state = null;
    }
    return permissionGranted == PermissionStatus.granted;
  }
}

final locationProvider =
    StateNotifierProvider<LocationNotifier, LocationModel?>((ref) {
  return LocationNotifier();
});


*/