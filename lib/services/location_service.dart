import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationService {
  StreamController<Position> positionStreamController =
      StreamController<Position>.broadcast();

  Stream<Position> get positionStream => positionStreamController.stream;

  LocationService() {
    Geolocator.getPositionStream().listen((Position position) {
      positionStreamController.add(position);
    });
  }
}
