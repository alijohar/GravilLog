class UserEntity {
  final int? id;
  final String? fullname;
  final String? profileImage;
  final String? gender;
  final String? password;
  final String? sn;
  final int? deleted;
  final int? screenshot;
  final String? country;
  final String? birthDate;
  final String? lastSeen;
  final String? fcmToken;
  final String? token;
  final String? mediaUid;
  final String? accountType;
  final String? accountValue;
  final String? uuid;
  final int? mobileType;
  final bool? isActive;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final bool? newAccount;
  final String? latitude;
  final String? longitude;

  const UserEntity({
    required this.id,
    required this.fullname,
    required this.profileImage,
    required this.gender,
    required this.password,
    required this.sn,
    required this.deleted,
    required this.screenshot,
    this.country,
    required this.birthDate,
    this.lastSeen,
    this.fcmToken,
    this.token,
    this.mediaUid,
    required this.accountType,
    required this.accountValue,
    this.uuid,
    required this.mobileType,
    required this.isActive,
    this.status,
    required this.createdAt,
    required this.updatedAt,
    this.newAccount,
    this.latitude,
    this.longitude
  });
}
class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class  SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

