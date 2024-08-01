import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverRecord extends FirestoreRecord {
  DriverRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "CNIC" field.
  int? _cnic;
  int get cnic => _cnic ?? 0;
  bool hasCnic() => _cnic != null;

  // "CNIC_url" field.
  String? _cNICUrl;
  String get cNICUrl => _cNICUrl ?? '';
  bool hasCNICUrl() => _cNICUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "penalizeUser" field.
  bool? _penalizeUser;
  bool get penalizeUser => _penalizeUser ?? false;
  bool hasPenalizeUser() => _penalizeUser != null;

  // "restrictedUser" field.
  bool? _restrictedUser;
  bool get restrictedUser => _restrictedUser ?? false;
  bool hasRestrictedUser() => _restrictedUser != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "VehicalModel" field.
  String? _vehicalModel;
  String get vehicalModel => _vehicalModel ?? '';
  bool hasVehicalModel() => _vehicalModel != null;

  // "carlicense" field.
  String? _carlicense;
  String get carlicense => _carlicense ?? '';
  bool hasCarlicense() => _carlicense != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "VehicalRegistrationNumber" field.
  String? _vehicalRegistrationNumber;
  String get vehicalRegistrationNumber => _vehicalRegistrationNumber ?? '';
  bool hasVehicalRegistrationNumber() => _vehicalRegistrationNumber != null;

  // "VehicalType" field.
  String? _vehicalType;
  String get vehicalType => _vehicalType ?? '';
  bool hasVehicalType() => _vehicalType != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "license" field.
  String? _license;
  String get license => _license ?? '';
  bool hasLicense() => _license != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "rejectedReason" field.
  String? _rejectedReason;
  String get rejectedReason => _rejectedReason ?? '';
  bool hasRejectedReason() => _rejectedReason != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _cnic = castToType<int>(snapshotData['CNIC']);
    _cNICUrl = snapshotData['CNIC_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _penalizeUser = snapshotData['penalizeUser'] as bool?;
    _restrictedUser = snapshotData['restrictedUser'] as bool?;
    _age = castToType<int>(snapshotData['age']);
    _dob = snapshotData['dob'] as DateTime?;
    _vehicalModel = snapshotData['VehicalModel'] as String?;
    _carlicense = snapshotData['carlicense'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _vehicalRegistrationNumber =
        snapshotData['VehicalRegistrationNumber'] as String?;
    _vehicalType = snapshotData['VehicalType'] as String?;
    _gender = snapshotData['gender'] as String?;
    _license = snapshotData['license'] as String?;
    _online = snapshotData['online'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _status = snapshotData['Status'] as String?;
    _rejectedReason = snapshotData['rejectedReason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('driver');

  static Stream<DriverRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverRecord.fromSnapshot(s));

  static Future<DriverRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverRecord.fromSnapshot(s));

  static DriverRecord fromSnapshot(DocumentSnapshot snapshot) => DriverRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverRecordData({
  String? email,
  int? cnic,
  String? cNICUrl,
  String? displayName,
  bool? penalizeUser,
  bool? restrictedUser,
  int? age,
  DateTime? dob,
  String? vehicalModel,
  String? carlicense,
  DateTime? createdTime,
  String? vehicalRegistrationNumber,
  String? vehicalType,
  String? gender,
  String? license,
  bool? online,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
  String? status,
  String? rejectedReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'CNIC': cnic,
      'CNIC_url': cNICUrl,
      'display_name': displayName,
      'penalizeUser': penalizeUser,
      'restrictedUser': restrictedUser,
      'age': age,
      'dob': dob,
      'VehicalModel': vehicalModel,
      'carlicense': carlicense,
      'created_time': createdTime,
      'VehicalRegistrationNumber': vehicalRegistrationNumber,
      'VehicalType': vehicalType,
      'gender': gender,
      'license': license,
      'online': online,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
      'Status': status,
      'rejectedReason': rejectedReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverRecordDocumentEquality implements Equality<DriverRecord> {
  const DriverRecordDocumentEquality();

  @override
  bool equals(DriverRecord? e1, DriverRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.cnic == e2?.cnic &&
        e1?.cNICUrl == e2?.cNICUrl &&
        e1?.displayName == e2?.displayName &&
        e1?.penalizeUser == e2?.penalizeUser &&
        e1?.restrictedUser == e2?.restrictedUser &&
        e1?.age == e2?.age &&
        e1?.dob == e2?.dob &&
        e1?.vehicalModel == e2?.vehicalModel &&
        e1?.carlicense == e2?.carlicense &&
        e1?.createdTime == e2?.createdTime &&
        e1?.vehicalRegistrationNumber == e2?.vehicalRegistrationNumber &&
        e1?.vehicalType == e2?.vehicalType &&
        e1?.gender == e2?.gender &&
        e1?.license == e2?.license &&
        e1?.online == e2?.online &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.status == e2?.status &&
        e1?.rejectedReason == e2?.rejectedReason;
  }

  @override
  int hash(DriverRecord? e) => const ListEquality().hash([
        e?.email,
        e?.cnic,
        e?.cNICUrl,
        e?.displayName,
        e?.penalizeUser,
        e?.restrictedUser,
        e?.age,
        e?.dob,
        e?.vehicalModel,
        e?.carlicense,
        e?.createdTime,
        e?.vehicalRegistrationNumber,
        e?.vehicalType,
        e?.gender,
        e?.license,
        e?.online,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber,
        e?.status,
        e?.rejectedReason
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverRecord;
}
