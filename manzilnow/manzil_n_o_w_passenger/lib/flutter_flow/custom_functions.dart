import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? latLntToString(LatLng? inputLocation) {
  // return inputLocation as string
  if (inputLocation == null) {
    return null;
  }

  return '${inputLocation.latitude},${inputLocation.longitude}';
}

String? listToString(List<String>? inputList) {
  // return inputList as a singular comma seperated string
// return inputList as a singular comma separated string
  if (inputList == null || inputList.isEmpty) {
    return null;
  }
  return inputList.join(', ');
}

List<LatLng>? latLngToList(
  LatLng? pickup,
  LatLng? destination,
) {
  // return pickup and destination as a list of latlng
  if (pickup == null || destination == null) {
    return null;
  }
  return [pickup, destination];
}

int? recFareCalculation(
  int? fuelPrice,
  int? carBaseFare,
  int? carFuelConsumption,
  int? bikeBaseFare,
  int? bikeFuelConsumption,
  int? rickshawBaseFare,
  int? rickshawFuelConsumption,
  String? vehicleType,
  int? distanceMeters,
) {
  // returns suggested fare
  if (fuelPrice == null ||
      carBaseFare == null ||
      carFuelConsumption == null ||
      bikeBaseFare == null ||
      bikeFuelConsumption == null ||
      rickshawBaseFare == null ||
      rickshawFuelConsumption == null ||
      vehicleType == null ||
      distanceMeters == null) {
    return null;
  }

  double distance = distanceMeters / 1000.0;
  double carFuelConsumed = carFuelConsumption / 100.0;
  double bikeFuelConsumed = bikeFuelConsumption / 100.0;
  double rickshawFuelConsumed = rickshawFuelConsumption / 100.0;

  switch (vehicleType) {
    case 'Car':
      return (carBaseFare + (distance * carFuelConsumed * fuelPrice)).round();
    case 'Bike':
      return (bikeBaseFare + (distance * bikeFuelConsumed * fuelPrice)).round();
    case 'Rickshaw':
      return (rickshawBaseFare + (distance * rickshawFuelConsumed * fuelPrice))
          .round();
    default:
      return null;
  }
}

int? minFare(int? recFare) {
  // returns 20% less of recFare
  if (recFare != null) {
    double min = recFare * 0.8;
    return min.toInt();
  }
  return null;
}

String? clipAddress(String? input) {
  // takes a comma seperated string as input and returns the snippet after the first comma in the string
  if (input == null) return null;
  final parts = input.split(',');
  if (parts.length > 1) {
    return parts[1].trim();
  } else {
    return null;
  }
}
