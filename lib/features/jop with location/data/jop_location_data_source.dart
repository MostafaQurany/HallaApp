import 'package:geolocator/geolocator.dart';

abstract class JobLocationDataSource {
  /// get the user current location
  Future<Position> getCurrentLocation();
}

class JobLocationDataSourceImpl extends JobLocationDataSource {
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
}
