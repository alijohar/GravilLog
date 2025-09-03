import '../../business/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? fullname,
    String? profileImage,
    String? gender,
    String? password,
    String? sn,
    int? deleted,
    int? screenshot,
    String? country,
    String? birthDate,
    String? lastSeen,
    String? fcmToken,
    String? token,
    String? mediaUid,
    String? accountType,
    String? accountValue,
    String? uuid,
    int? mobileType,
    bool? isActive,
    String? status,
    String? createdAt,
    String? updatedAt,
    bool? newAccount,
    String? latitude,
    String? longitude,
  }) : super(
      id: id,
      fullname: fullname,
      profileImage: profileImage,
      gender: gender,
      password: password,
      sn: sn,
      deleted: deleted,
      screenshot: screenshot,
      country: country,
      birthDate: birthDate,
      lastSeen: lastSeen,
      fcmToken: fcmToken,
      token: token,
      mediaUid: mediaUid,
      accountType: accountType,
      accountValue: accountValue,
      uuid: uuid,
      mobileType: mobileType,
      isActive: isActive,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      newAccount: newAccount,
      longitude: longitude,
      latitude: latitude
  );

  UserModel.test({num}) : super(
      id: 0,
      fullname: "fullname $num",
      profileImage: "profileImage",
      gender: "gender",
      password: "password",
      sn: "sn",
      deleted: 0,
      screenshot: 0,
      country: "country",
      birthDate: "birthDate",
      lastSeen: "lastSeen",
      fcmToken: "fcmToken",
      token: "token",
      mediaUid: "mediaUid",
      accountType: "accountType",
      accountValue: "accountValue",
      uuid: "uuid",
      mobileType: 0,
      isActive: true,
      status: "status",
      createdAt: "createdAt",
      updatedAt: "updatedAt",
      newAccount: true
  );

  factory UserModel.fromJson(Map<String, dynamic> json, {token, fromLocal = false, newAccount }) {
    return UserModel(
        id: json['id'],
        fullname: json['fullname'],
        profileImage: json['profile_image'] ?? "",
        gender: json['gender'],
        password: json['password'],
        sn: json['sn'],
        deleted: json['deleted'],
        screenshot: json['screenshot'],
        country: json['country'],
        birthDate: json['birth_date'],
        lastSeen: json['last_seen'],
        fcmToken: json['fcm_token'],
        token: fromLocal ? json['token'] : token,
        mediaUid: json['media_uid'],
        accountType: json['account_type'],
        accountValue: json['account_value'],
        uuid: json['uuid'],
        mobileType: json['mobile_type'],
        isActive: json['isActive'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        newAccount: newAccount
    );
  }

  factory UserModel.fromMsgJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullname: json['fullname'],
      sn: json['sn'] ?? "",
      profileImage: json['profile_image'] ?? "",
    );
  }
  factory UserModel.fromMsgNotificationJson(Map<String, dynamic> json, int id) {
    return UserModel(
      id: id,
      fullname: json['fullname'],
      sn: json['sn'] ?? "",
      profileImage: json['profile_image'] ?? "",
    );
  }

  factory UserModel.fromViews(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      fullname: json['fullname'],
      profileImage: json['profile_image'] ?? "",
      sn: json['sn'],
    );
  }

  factory UserModel.fromChatLocal(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      fullname: json['user_full_name'],
      profileImage: json['user_profile_image'],
      sn: json['user_sn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'profile_image': profileImage,
      'gender': gender,
      'password': password,
      'sn': sn,
      'deleted': deleted,
      'screenshot': screenshot,
      'country': country,
      'birth_date': birthDate,
      'last_seen': lastSeen,
      'fcm_token': fcmToken,
      'token': token,
      'media_uid': mediaUid,
      'account_type': accountType,
      'account_value': accountValue,
      'uuid': uuid,
      'mobile_type': mobileType,
      'isActive': isActive,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'new_account':newAccount
    };
  }
}