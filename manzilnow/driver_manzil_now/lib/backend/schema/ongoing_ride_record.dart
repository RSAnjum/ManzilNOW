import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OngoingRideRecord extends FirestoreRecord {
  OngoingRideRecord._(
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

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _pickup = snapshotData['pickup'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _fare = castToType<int>(snapshotData['fare']);
    _vehicalType = snapshotData['vehicalType'] as String?;
    _pickupAdd = snapshotData['pickup_add'] as String?;
    _destinationAdd = snapshotData['destination_add'] as String?;
    _distance = castToType<int>(snapshotData['distance']);
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _passengerUid = snapshotData['passenger_uid'] as String?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ongoingRide');

  static Stream<OngoingRideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OngoingRideRecord.fromSnapshot(s));

  static Future<OngoingRideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OngoingRideRecord.fromSnapshot(s));

  static OngoingRideRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OngoingRideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OngoingRideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OngoingRideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OngoingRideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OngoingRideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOngoingRideRecordData({
  LatLng? pickup,
  LatLng? destination,
  int? fare,
  String? vehicalType,
  String? pickupAdd,
  String? destinationAdd,
  int? distance,
  String? paymentMethod,
  String? passengerUid,
  String? driverUid,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pickup': pickup,
      'destination': destination,
      'fare': fare,
      'vehicalType': vehicalType,
      'pickup_add': pickupAdd,
      'destination_add': destinationAdd,
      'distance': distance,
      'paymentMethod': paymentMethod,
      'passenger_uid': passengerUid,
      'driver_uid': driverUid,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OngoingRideRecordDocumentEquality implements Equality<OngoingRideRecord> {
  const OngoingRideRecordDocumentEquality();

  @override
  bool equals(OngoingRideRecord? e1, OngoingRideRecord? e2) {
    return e1?.pickup == e2?.pickup &&
        e1?.destination == e2?.destination &&
        e1?.fare == e2?.fare &&
        e1?.vehicalType == e2?.vehicalType &&
        e1?.pickupAdd == e2?.pickupAdd &&
        e1?.destinationAdd == e2?.destinationAdd &&
        e1?.distance == e2?.distance &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.passengerUid == e2?.passengerUid &&
        e1?.driverUid == e2?.driverUid &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(OngoingRideRecord? e) => const ListEquality().hash([
        e?.pickup,
        e?.destination,
        e?.fare,
        e?.vehicalType,
        e?.pickupAdd,
        e?.destinationAdd,
        e?.distance,
        e?.paymentMethod,
        e?.passengerUid,
        e?.driverUid,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is OngoingRideRecord;
}
