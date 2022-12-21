import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? userUid;
  String? username;
  String? displayName;
  String? email;
  String? birthday;
  String? bio;
  String? address;
  String? profileImage;
  String? gender;
  bool? isOrganizer;

  UserModel({
    this.userUid,
    this.username,
    this.displayName,
    this.email,
    this.birthday,
    this.bio,
    this.address,
    this.profileImage,
    this.gender,
    this.isOrganizer,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    userUid = json['userUid'] as String?;
    username = json['username'] as String?;
    displayName = json['displayName'] as String?;
    email = json['email'] as String?;
    birthday = json['birthday'] as String?;
    bio = json['bio'] as String?;
    address = json['address'] as String?;
    profileImage = json['profileImage'] as String?;
    gender = json['gender'] as String?;
    isOrganizer = json['isOrganizer'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userUid'] = userUid;
    data['username'] = username;
    data['displayName'] = displayName;
    data['email'] = email;
    data['birthday'] = birthday;
    data['bio'] = bio;
    data['address'] = address;
    data['profileImage'] = profileImage;
    data['gender'] = gender;
    data['isOrganizer'] = isOrganizer;
    return data;
  }

  UserModel copyWith({
    String? userUid,
    String? username,
    String? displayName,
    String? email,
    String? birthday,
    String? bio,
    String? address,
    String? profileImage,
    String? gender,
    bool? isOrganizer,
  }) {
    return UserModel(
      userUid: userUid ?? this.userUid,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      gender: gender ?? this.gender,
      isOrganizer: isOrganizer ?? this.isOrganizer,
    );
  }

  @override
  List<Object?> get props => [
        userUid,
        username,
        displayName,
        email,
        birthday,
        bio,
        address,
        profileImage,
        gender,
        isOrganizer,
      ];
}
