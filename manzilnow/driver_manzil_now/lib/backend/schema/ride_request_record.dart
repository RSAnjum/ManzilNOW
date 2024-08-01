import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideRequestRecord extends FirestoreRecord {
  RideRequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pickup" field.
  LatLng? _pickup;
  LatLng? get pickup => _pickup;
  bool hasPickup() => _pickup != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "fare" field.
  int? _fare;
  int get fare => _fare ?? 0;
  bool hasFare() => _fare != null;

  // "additionalReq" field.
  String? _additionalReq;
  String get additionalReq => _additionalReq ?? '';
  bool hasAdditionalReq() => _additionalReq != null;

  // "vehicalType" field.
  String? _vehicalType;
  String get vehicalType => _vehicalType ?? '';
  bool hasVehicalType() => _vehicalType != null;

  // "pickup_add" field.
  String? _pickupAdd;
  String get pickupAdd => _pickupAdd ?? '';
  bool hasPickupAdd() => _pickupAdd != null;

  // "destination_add" field.
  String? _destinationAdd;
  String get destinationAdd => _destinationAdd ?? '';
  bool hasDestinationAdd() => _destinationAdd != null;

  // "distance" field.
  int? _distance;
  int get distance => _distance ?? 0;
  bool hasDistance() => _distance != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "passenger_uid" field.
  String? _passengerUid;
  String get passengerUid => _passengerUid ?? '';
  bool hasPassengerUid() => _passengerUid != null;

  // "distanceText" field.
  String? _distanceText;
  String get distanceText => _distanceText ?? '';
  bool hasDistanceText() => _distanceText != null;

  // "reqFemale" field.
  bool? _reqFemale;
  bool get reqFemale => _reqFemale ?? false;
  bool hasReqFemale() => _reqFemale != null;

  // "isFemale" field.
  bool? _isFemale;
  bool get isFemale => _isFemale ?? false;
  bool hasIsFemale() => _isFemale != null;

  // "is_driver_assigned" field.
  bool? _isDriverAssigned;
  bool get isDriverAssigned => _isDriverAssigned ?? false;
  bool hasIsDriverAssigned() => _isDriverAssigned != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _pickup = snapshotData['pickup'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _fare = castToType<int>(snapshotData['fare']);
    _additionalReq = snapshotData['additionalReq'] as String?;
    _vehicalType = snapshotData['vehicalType'] as String?;
    _pickupAdd = snapshotData['pickup_add'] as String?;
    _destinationAdd = snapshotData['destination_add'] as String?;
    _distance = castToType<int>(snapshotData['distance']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _passengerUid = snapshotData['passenger_uid'] as String?;
    _distanceText = snapshotData['distanceText'] as String?;
    _reqFemale = snapshotData['reqFemale'] as bool?;
    _isFemale = snapshotData['isFemale'] as bool?;
    _isDriverAssigned = snapshotData['is_driver_assigned'] as bool?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rideRequest');

  static Stream<RideRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideRequestRecord.fromSnapshot(s));

  static Future<RideRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideRequestRecord.fromSnapshot(s));

  static RideRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RideRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideRequestRecordData({
  LatLng? pickup,
  LatLng? destination,
  int? fare,
  String? additionalReq,
  String? vehicalType,
  String? pickupAdd,
  String? destinationAdd,
  int? distance,
  String? paymentMethod,
  String? passengerUid,
  String? distanceText,
  bool? reqFemale,
  bool? isFemale,
  bool? isDriverAssigned,
  String? driverUid,
  LatLng? driverLocation,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pickup': pickup,
      'destination': destination,
      'fare': fare,
      'additionalReq': additionalReq,
      'vehicalType': vehicalType,
      'pickup_add': pickupAdd,
      'destination_add': destinationAdd,
      'distance': distance,
      'paymentMethod': paymentMethod,
      'passenger_uid': passengerUid,
      'distanceText': distanceText,
      'reqFemale': reqFemale,
      'isFemale': isFemale,
      'is_driver_assigned': isDriverAssigned,
      'driver_uid': driverUid,
      'driver_location': driverLocation,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideRequestRecordDocumentEquality implements Equality<RideRequestRecord> {
  const RideRequestRecordDocumentEquality();

  @override
  bool equals(RideRequestRecord? e1, RideRequestRecord? e2) {
    return e1?.pickup == e2?.pickup &&
        e1?.destination == e2?.destination &&
        e1?.fare == e2?.fare &&
        e1?.additionalReq == e2?.additionalReq &&
        e1?.vehicalType == e2?.vehicalType &&
        e1?.pickupAdd == e2?.pickupAdd &&
        e1?.destinationAdd == e2?.destinationAdd &&
        e1?.distance == e2?.distance &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.passengerUid == e2?.passengerUid &&
        e1?.distanceText == e2?.distanceText &&
        e1?.reqFemale == e2?.reqFemale &&
        e1?.isFemale == e2?.isFemale &&
        e1?.isDriverAssigned == e2?.isDriverAssigned &&
        e1?.driverUid == e2?.driverUid &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.status == e2?.status;
  }

  @override
  int hash(RideRequestRecord? e) => const ListEquality().hash([
        e?.pickup,
        e?.destination,
        e?.fare,
        e?.additionalReq,
        e?.vehicalType,
        e?.pickupAdd,
        e?.destinationAdd,
        e?.distance,
        e?.paymentMethod,
        e?.passengerUid,
        e?.distanceText,
        e?.reqFemale,
        e?.isFemale,
        e?.isDriverAssigned,
        e?.driverUid,
        e?.driverLocation,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is RideRequestRecord;
}
