import 'package:firebase_auth/firebase_auth.dart';
import 'package:package/package.dart';

import '../../../domain/entity/user/user_entity.dart';

class UserJson {
  final String id, name, email, phoneNo, profileImg, referralBy, status, gender;
  final String? date;

  const UserJson({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.profileImg,
    required this.referralBy,
    required this.status,
    required this.gender,
    required this.date,
  });

  factory UserJson.fromMap(Map<String, dynamic> map) {
    map.log;
    return UserJson(
      id: (map['id'] as Object?).toStr ?? '',
      name: (map['name'] as Object?).toStr ?? '',
      phoneNo: (map['mobile_no'] as Object?).toStr ?? '',
      status: (map['status'] as Object?).toStr ?? '',
      email: (map['email'] as Object?).toStr ?? '',
      referralBy: (map['referal_by'] as Object?).toStr ?? '',
      profileImg: (map['image'] as Object?).toStr ?? '',
      gender: (map['gender'] as Object?).toStr ?? '',
      date: (map['date'] as Object?).toStr ?? '',
    );
  }

  factory UserJson.fromLocal(Map<String, dynamic> json) {
    return UserJson(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNo: json['phoneNo'],
      profileImg: json['profileImg'],
      referralBy: json['referralBy'],
      status: json['status'],
      gender: json['gender'],
      date: json['date'],
    );
  }
  factory UserJson.fromFirebase(User? user) => UserJson(
        id: user!.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        phoneNo: user.phoneNumber ?? '',
        profileImg: user.photoURL ?? '',
        referralBy: '',
        status: '',
        gender: 'male',
        date: user.metadata.creationTime.toString(),
      );

  UserEntity toDomain() => UserEntity(
      id: id,
      name: name,
      email: email,
      phoneNo: phoneNo,
      profileImg: profileImg,
      referralBy: referralBy,
      status: status.toint,
      gender: gender.toGender,
      date: StaticMethods.convertDate(date));
}
