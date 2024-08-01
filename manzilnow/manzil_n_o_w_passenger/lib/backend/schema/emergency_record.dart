import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EmergencyRecord extends FirestoreRecord {
  EmergencyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "passengerLocation" field.
  LatLng? _passengerLocation;
  LatLng? get passengerLocation => _passengerLocation;
  bool hasPassengerLocation() => _passengerLocation != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "rideId" field.
  String? _rideId;
  String get rideId => _rideId ?? '';
  bool hasRideId() => _rideId != null;

  void _initializeFields() {
    _passengerLocation = snapshotData['passengerLocation'] as LatLng?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _rideId = snapshotData['rideId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emergency');

  static Stream<EmergencyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmergencyRecord.fromSnapshot(s));

  static Future<EmergencyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmergencyRecord.fromSnapshot(s));

  static EmergencyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmergencyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmergencyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmergencyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmergencyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmergencyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmergencyRecordData({
  LatLng? passengerLocation,
  String? driverUid,
  String? rideId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'passengerLocation': passengerLocation,
      'driver_uid': driverUid,
      'rideId': rideId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmergencyRecordDocumentEquality implements Equality<EmergencyRecord> {
  const EmergencyRecordDocumentEquality();

  @override
  bool equals(EmergencyRecord? e1, EmergencyRecord? e2) {
    return e1?.passengerLocation == e2?.passengerLocation &&
        e1?.driverUid == e2?.driverUid &&
        e1?.rideId == e2?.rideId;
  }

  @override
  int hash(EmergencyRecord? e) => const ListEquality()
      .hash([e?.passengerLocation, e?.driverUid, e?.rideId]);

  @override
  bool isValidKey(Object? o) => o is EmergencyRecord;
}
