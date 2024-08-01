import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideOffersRecord extends FirestoreRecord {
  RideOffersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rideID" field.
  String? _rideID;
  String get rideID => _rideID ?? '';
  bool hasRideID() => _rideID != null;

  // "fare" field.
  int? _fare;
  int get fare => _fare ?? 0;
  bool hasFare() => _fare != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "driverLocation" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  void _initializeFields() {
    _rideID = snapshotData['rideID'] as String?;
    _fare = castToType<int>(snapshotData['fare']);
    _driverName = snapshotData['driver_name'] as String?;
    _driverLocation = snapshotData['driverLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rideOffers');

  static Stream<RideOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideOffersRecord.fromSnapshot(s));

  static Future<RideOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideOffersRecord.fromSnapshot(s));

  static RideOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RideOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideOffersRecordData({
  String? rideID,
  int? fare,
  String? driverName,
  LatLng? driverLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rideID': rideID,
      'fare': fare,
      'driver_name': driverName,
      'driverLocation': driverLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideOffersRecordDocumentEquality implements Equality<RideOffersRecord> {
  const RideOffersRecordDocumentEquality();

  @override
  bool equals(RideOffersRecord? e1, RideOffersRecord? e2) {
    return e1?.rideID == e2?.rideID &&
        e1?.fare == e2?.fare &&
        e1?.driverName == e2?.driverName &&
        e1?.driverLocation == e2?.driverLocation;
  }

  @override
  int hash(RideOffersRecord? e) => const ListEquality()
      .hash([e?.rideID, e?.fare, e?.driverName, e?.driverLocation]);

  @override
  bool isValidKey(Object? o) => o is RideOffersRecord;
}
