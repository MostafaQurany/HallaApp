import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

abstract class JobLocationDataSource {
  /// get the user current location
  Future<Position> getCurrentLocation();

  Future<List<Map<String, dynamic>>> getNearbyUsers({
    required double userLat,
    required double userLong,
    required double range,
    required String jobTag,
  });
}

class JobLocationDataSourceImpl extends JobLocationDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Position> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get current location
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      throw "Filed to get current location cause error: $e";
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getNearbyUsers({
    required double userLat,
    required double userLong,
    required double range,
    required String jobTag,
  }) async {
    if (jobTag.isEmpty) return [];

    // Step 1: Fetch users roughly within the latitude and longitude range
    final usersInLatLongRange =
        await _fetchUsersByLatitudeAndLongitude(userLat, userLong, range);
    print('usersInLatLongRange = ${usersInLatLongRange.length}');
    // Step 3: Perform exact filtering on job tag and location
    return _filterByDistanceAndTag(
        usersInLatLongRange, userLat, userLong, range, jobTag);
  }

  /// ✅ Fetch users from Firestore within latitude Longitude boundaries
  Future<List<Map<String, dynamic>>> _fetchUsersByLatitudeAndLongitude(
      double userLat, double userLong, double rangeKm) async {
    double latOffset = rangeKm / 111.0;
    double longOffset = rangeKm / (111.0 * cos(userLat * pi / 180));

    double minLat = userLat - latOffset;
    double maxLat = userLat + latOffset;
    double minLong = userLong - longOffset;
    double maxLong = userLong + longOffset;

    final querySnapshot = await _firestore
        .collection('users')
        .where('latitude', isGreaterThanOrEqualTo: minLat)
        .where('latitude', isLessThanOrEqualTo: maxLat)
        .where('longitude', isGreaterThanOrEqualTo: minLong)
        .where('longitude', isLessThanOrEqualTo: maxLong)
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  /// ✅ Apply final filtering: exact distance check & fuzzy tag matching
  List<Map<String, dynamic>> _filterByDistanceAndTag(
      List<Map<String, dynamic>> users,
      double userLat,
      double userLong,
      double range,
      String jobTag) {
    return users.where((user) {
      final double lat = user['latitude'];
      final double long = user['longitude'];
      final double distance =
          Geolocator.distanceBetween(userLat, userLong, lat, long) / 1000;
      print("distance: $distance");
      final bool matchesTag = _fuzzyMatch(jobTag, user['jobTitles']);
      print("matching tag: $matchesTag");
      return distance <= range && matchesTag;
    }).toList();
  }

  /// ✅ Check if any job tag contains the search query (case-insensitive)
  bool _fuzzyMatch(String query, List<dynamic> tags) {
    return tags.any(
        (tag) => tag.toString().toLowerCase().contains(query.toLowerCase()));
  }
}
