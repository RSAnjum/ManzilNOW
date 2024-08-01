import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FareRecord extends FirestoreRecord {
  FareRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "carBaseFare" field.
  int? _carBaseFare;
  int get carBaseFare => _carBaseFare ?? 0;
  bool hasCarBaseFare() => _carBaseFare != null;

  // "carFuelConsumption" field.
  int? _carFuelConsumption;
  int get carFuelConsumption => _carFuelConsumption ?? 0;
  bool hasCarFuelConsumption() => _carFuelConsumption != null;

  // "bikeBaseFare" field.
  int? _bikeBaseFare;
  int get bikeBaseFare => _bikeBaseFare ?? 0;
  bool hasBikeBaseFare() => _bikeBaseFare != null;

  // "bikeFuelConsumption" field.
  int? _bikeFuelConsumption;
  int get bikeFuelConsumption => _bikeFuelConsumption ?? 0;
  bool hasBikeFuelConsumption() => _bikeFuelConsumption != null;

  // "rickshawBaseFare" field.
  int? _rickshawBaseFare;
  int get rickshawBaseFare => _rickshawBaseFare ?? 0;
  bool hasRickshawBaseFare() => _rickshawBaseFare != null;

  // "rickshawFuelConsumption" field.
  int? _rickshawFuelConsumption;
  int get rickshawFuelConsumption => _rickshawFuelConsumption ?? 0;
  bool hasRickshawFuelConsumption() => _rickshawFuelConsumption != null;

  // "fuelPrice" field.
  int? _fuelPrice;
  int get fuelPrice => _fuelPrice ?? 0;
  bool hasFuelPrice() => _fuelPrice != null;

  void _initializeFields() {
    _carBaseFare = castToType<int>(snapshotData['carBaseFare']);
    _carFuelConsumption = castToType<int>(snapshotData['carFuelConsumption']);
    _bikeBaseFare = castToType<int>(snapshotData['bikeBaseFare']);
    _bikeFuelConsumption = castToType<int>(snapshotData['bikeFuelConsumption']);
    _rickshawBaseFare = castToType<int>(snapshotData['rickshawBaseFare']);
    _rickshawFuelConsumption =
        castToType<int>(snapshotData['rickshawFuelConsumption']);
    _fuelPrice = castToType<int>(snapshotData['fuelPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fare');

  static Stream<FareRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FareRecord.fromSnapshot(s));

  static Future<FareRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FareRecord.fromSnapshot(s));

  static FareRecord fromSnapshot(DocumentSnapshot snapshot) => FareRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FareRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FareRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FareRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FareRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFareRecordData({
  int? carBaseFare,
  int? carFuelConsumption,
  int? bikeBaseFare,
  int? bikeFuelConsumption,
  int? rickshawBaseFare,
  int? rickshawFuelConsumption,
  int? fuelPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'carBaseFare': carBaseFare,
      'carFuelConsumption': carFuelConsumption,
      'bikeBaseFare': bikeBaseFare,
      'bikeFuelConsumption': bikeFuelConsumption,
      'rickshawBaseFare': rickshawBaseFare,
      'rickshawFuelConsumption': rickshawFuelConsumption,
      'fuelPrice': fuelPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class FareRecordDocumentEquality implements Equality<FareRecord> {
  const FareRecordDocumentEquality();

  @override
  bool equals(FareRecord? e1, FareRecord? e2) {
    return e1?.carBaseFare == e2?.carBaseFare &&
        e1?.carFuelConsumption == e2?.carFuelConsumption &&
        e1?.bikeBaseFare == e2?.bikeBaseFare &&
        e1?.bikeFuelConsumption == e2?.bikeFuelConsumption &&
        e1?.rickshawBaseFare == e2?.rickshawBaseFare &&
        e1?.rickshawFuelConsumption == e2?.rickshawFuelConsumption &&
        e1?.fuelPrice == e2?.fuelPrice;
  }

  @override
  int hash(FareRecord? e) => const ListEquality().hash([
        e?.carBaseFare,
        e?.carFuelConsumption,
        e?.bikeBaseFare,
        e?.bikeFuelConsumption,
        e?.rickshawBaseFare,
        e?.rickshawFuelConsumption,
        e?.fuelPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is FareRecord;
}
