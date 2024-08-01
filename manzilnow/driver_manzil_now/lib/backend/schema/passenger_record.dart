import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassengerRecord extends FirestoreRecord {
  PassengerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "restricted" field.
  bool? _restricted;
  bool get restricted => _restricted ?? false;
  bool hasRestricted() => _restricted != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _restricted = snapshotData['restricted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passenger');

  static Stream<PassengerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassengerRecord.fromSnapshot(s));

  static Future<PassengerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassengerRecord.fromSnapshot(s));

  static PassengerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassengerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassengerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassengerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassengerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassengerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassengerRecordData({
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? gender,
  int? phoneNumber,
  String? photoUrl,
  String? uid,
  String? lastName,
  bool? restricted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'gender': gender,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'uid': uid,
      'last_name': lastName,
      'restricted': restricted,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassengerRecordDocumentEquality implements Equality<PassengerRecord> {
  const PassengerRecordDocumentEquality();

  @override
  bool equals(PassengerRecord? e1, PassengerRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.gender == e2?.gender &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.lastName == e2?.lastName &&
        e1?.restricted == e2?.restricted;
  }

  @override
  int hash(PassengerRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.createdTime,
        e?.gender,
        e?.phoneNumber,
        e?.photoUrl,
        e?.uid,
        e?.lastName,
        e?.restricted
      ]);

  @override
  bool isValidKey(Object? o) => o is PassengerRecord;
}
