import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class NoParams {}

class MessageParams {}



class AuthParams {
  int? id;
  String? type;
  String? name;
  String? email;
  String? typeValue;
  String? password;
  String? image;
  String? country;
  String? token;
  DateTime? birthDate;
  String? uuid;
  bool? patient;
  String? phoneNumber;
  String? countryCode;
  String? language;






  AuthParams({
    this.id,
    this.name,
    this.typeValue,
    this.type,
    this.image,
    this.token,
    this.birthDate,
    this.patient,
    this.email,
    this.countryCode,
    this.phoneNumber
  });

  AuthParams.register({
    this.name,
    this.type,
    this.email,
    this.typeValue,
    this.country,
    this.birthDate,
    this.password,
    this.countryCode,
    this.phoneNumber,
  });
  AuthParams.registerGoogle({
    this.uuid,
    this.name,
    this.type,
    this.typeValue,
    this.image,
    this.country,
    this.birthDate,
    this.password,
  });
  AuthParams.login({this.patient, this.email, this.password});

  AuthParams.update({
    this.name,
    this.image,
    this.country,
  });

  AuthParams.getPatientInfo({
    this.token,

  });

  AuthParams.resetPassword({
    this.email,
    this.language,

  });



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type_value": typeValue,
    "type": type,
  };

  Map<String, dynamic> toUpdateProfileJson() => {
    "fullname": name,
    "profile_image": image,
    "country": country,
  };

  // Map<String, dynamic> toUpdateLocationJson() => {
  //   "latitude": latitude,
  //   "longitude": longitude,
  // };

  Map<String, dynamic> toRegisterJson() => {
    "fullname": name,
    "account_value": typeValue,
    "account_type": type,
    if (password != null) "password": password,
    if (country != null) "country": country,
    "mobile_type": Platform.isAndroid ? 0 : 1,
    if (uuid != null) "uuid": uuid,
    "profile_image": image ?? "",
  };
  Map<String, dynamic> toLoginJson() => {
    "patient": patient,
    "password": password,
    "email": email,


  };

  Map<String, dynamic> toUpdateJson() => {
    "fullname": name,
    "profile_image": image,
    "country": country,
  };
}

class PregnantInfoParams {
  String? pregnancyId;
  String? pregnancyNumber;
  String? firstVisitDate;
  String? expectedDeliveryPlace;
  String? expectedDeliveryDate;
  String? expectedDeliveryMode;
  String? importantNotes;

  PregnantInfoParams({
    this.pregnancyId,
    this.pregnancyNumber,
    this.firstVisitDate,
    this.expectedDeliveryPlace,
    this.expectedDeliveryDate,
    this.expectedDeliveryMode,
    this.importantNotes,


  });

}
