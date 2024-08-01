import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompleteRideRecord extends FirestoreRecord {
  CompleteRideRecord._(
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

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

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
    _rating = castToType<int>(snapshotData['rating']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('completeRide');

  static Stream<CompleteRideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompleteRideRecord.fromSnapshot(s));

  static Future<CompleteRideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompleteRideRecord.fromSnapshot(s));

  static CompleteRideRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompleteRideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompleteRideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompleteRideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompleteRideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompleteRideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompleteRideRecordData({
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
  int? rating,
  DateTime? createdTime,
  String? photoUrl,
  String? displayName,
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
      'rating': rating,
      'created_time': createdTime,
      'photo_url': photoUrl,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompleteRideRecordDocumentEquality
    implements Equality<CompleteRideRecord> {
  const CompleteRideRecordDocumentEquality();

  @override
  bool equals(CompleteRideRecord? e1, CompleteRideRecord? e2) {
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
        e1?.rating == e2?.rating &&
        e1?.createdTime == e2?.createdTime &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(CompleteRideRecord? e) => const ListEquality().hash([
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
        e?.rating,
        e?.createdTime,
        e?.photoUrl,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is CompleteRideRecord;
}
