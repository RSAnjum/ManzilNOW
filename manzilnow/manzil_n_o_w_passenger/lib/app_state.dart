import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _pickup;
  LatLng? get pickup => _pickup;
  set pickup(LatLng? value) {
    _pickup = value;
  }

  LatLng? _destination;
  LatLng? get destination => _destination;
  set destination(LatLng? value) {
    _destination = value;
  }

  int _fare = 0;
  int get fare => _fare;
  set fare(int value) {
    _fare = value;
  }

  String _payment = 'Cash';
  String get payment => _payment;
  set payment(String value) {
    _payment = value;
  }

  String _additionalReq = '';
  String get additionalReq => _additionalReq;
  set additionalReq(String value) {
    _additionalReq = value;
  }

  bool _femaleReq = false;
  bool get femaleReq => _femaleReq;
  set femaleReq(bool value) {
    _femaleReq = value;
  }

  String _distText = '';
  String get distText => _distText;
  set distText(String value) {
    _distText = value;
  }

  int _distVal = 0;
  int get distVal => _distVal;
  set distVal(int value) {
    _distVal = value;
  }

  String _timeText = '';
  String get timeText => _timeText;
  set timeText(String value) {
    _timeText = value;
  }

  int _timeVal = 0;
  int get timeVal => _timeVal;
  set timeVal(int value) {
    _timeVal = value;
  }

  String _destName = '';
  String get destName => _destName;
  set destName(String value) {
    _destName = value;
  }

  String _pickupName = '';
  String get pickupName => _pickupName;
  set pickupName(String value) {
    _pickupName = value;
  }

  String _vehicleType = 'Car';
  String get vehicleType => _vehicleType;
  set vehicleType(String value) {
    _vehicleType = value;
  }

  int _carBaseFare = 0;
  int get carBaseFare => _carBaseFare;
  set carBaseFare(int value) {
    _carBaseFare = value;
  }

  int _carFuelConsumption = 0;
  int get carFuelConsumption => _carFuelConsumption;
  set carFuelConsumption(int value) {
    _carFuelConsumption = value;
  }

  int _bikeBaseFare = 0;
  int get bikeBaseFare => _bikeBaseFare;
  set bikeBaseFare(int value) {
    _bikeBaseFare = value;
  }

  int _bikeFuelConsumption = 0;
  int get bikeFuelConsumption => _bikeFuelConsumption;
  set bikeFuelConsumption(int value) {
    _bikeFuelConsumption = value;
  }

  int _rickshawBaseFare = 0;
  int get rickshawBaseFare => _rickshawBaseFare;
  set rickshawBaseFare(int value) {
    _rickshawBaseFare = value;
  }

  int _rickshawFuelConsumption = 0;
  int get rickshawFuelConsumption => _rickshawFuelConsumption;
  set rickshawFuelConsumption(int value) {
    _rickshawFuelConsumption = value;
  }

  int _fuelPrice = 0;
  int get fuelPrice => _fuelPrice;
  set fuelPrice(int value) {
    _fuelPrice = value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }
}
