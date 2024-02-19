
class UserEntity {
  final String id, name, email, phoneNo, profileImg, referralBy;
  final int status;
  final Gender? gender;
  final DateTime? date;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.profileImg,
    required this.referralBy,
    required this.status,
    required this.gender,
    this.date,
  });
  static const empty = UserEntity(
      id: '0',
      name: 'name',
      email: 'email',
      phoneNo: 'phoneNo',
      profileImg: 'profileImg',
      referralBy: 'referralBy',
      status: 0,
      gender: Gender.others);

  bool get isEmpty => this == UserEntity.empty;
  bool get isNotEmpty => this != UserEntity.empty;

  /// TODO: image network directory;
  String get profileImgPath => ''+ profileImg;

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNo,
    String? profileImg,
    String? referralBy,
    int? status,
    Gender? gender,
    DateTime? date,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      profileImg: profileImg ?? this.profileImg,
      referralBy: referralBy ?? this.referralBy,
      status: status ?? this.status,
      gender: gender ?? this.gender,
      date: date ?? this.date,
    );
  }

  @override
  String toString() =>
      'UserEntity{id: $id, name: $name, email: $email, phoneNo: $phoneNo, profileImg: $profileImg, referralBy: $referralBy, status: $status, gender: $gender, date: $date}';

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'name': name.toString(),
      'email': email.toString(),
      'phoneNo': phoneNo.toString(),
      'profileImg': profileImg.toString(),
      'referralBy': referralBy.toString(),
      'status': status.toString(),
      'gender': gender.toString(),
      'date': date.toString(),
    };
  }

}

enum Gender { male, feMale, others }

extension StringX on String {
  Gender get toGender {
    switch (toString()) {
      case 'male':
        return Gender.male;
      case 'female' || 'feMale':
        return Gender.feMale;
      case 'others':
        return Gender.others;
      default:
        return Gender.others;
    }
  }
}
