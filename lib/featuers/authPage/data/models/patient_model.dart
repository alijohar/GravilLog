import 'package:gravilog_2025/featuers/authPage/business/entities/Patient_entity.dart';

class PatientModel extends PatientEntity {
  PatientModel({
    required int? patientId,
    required String? firstName,
    required dynamic middleName,
    required dynamic lastName,
    required dynamic idNumber,
    required dynamic age,
    required dynamic phone,
    required int? countryId,
    required dynamic cityId,
    required dynamic addressLine,
    required String? email,
    required DateTime? createdAt,
    required String? confirmationToken,
    required DateTime? confirmedAt,
    required dynamic resetTokenCreated,
    required dynamic addPassword,
    required dynamic takeControl,
  }) : super(patientId: patientId, firstName:firstName , middleName: middleName,
      lastName: lastName, idNumber: idNumber, age: age, phone: phone, countryId: countryId,
      cityId: cityId, addressLine: addressLine, email: email, createdAt: createdAt, confirmationToken: confirmationToken, confirmedAt: confirmedAt, resetTokenCreated: resetTokenCreated,
      addPassword: addPassword, takeControl: takeControl);



  PatientModel copyWith({
    int? patientId,
    String? firstName,
    dynamic? middleName,
    dynamic? lastName,
    dynamic? idNumber,
    dynamic? age,
    dynamic? phone,
    int? countryId,
    dynamic? cityId,
    dynamic? addressLine,
    String? email,
    DateTime? createdAt,
    String? confirmationToken,
    DateTime? confirmedAt,
    dynamic? resetTokenCreated,
    dynamic? addPassword,
    dynamic? takeControl,
  }) {
    return PatientModel(
      patientId: patientId ?? this.patientId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      idNumber: idNumber ?? this.idNumber,
      age: age ?? this.age,
      phone: phone ?? this.phone,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      addressLine: addressLine ?? this.addressLine,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      confirmationToken: confirmationToken ?? this.confirmationToken,
      confirmedAt: confirmedAt ?? this.confirmedAt,
      resetTokenCreated: resetTokenCreated ?? this.resetTokenCreated,
      addPassword: addPassword ?? this.addPassword,
      takeControl: takeControl ?? this.takeControl,
    );
  }

  factory PatientModel.fromJson(Map<String, dynamic> json){
    return PatientModel(
      patientId: json["patient_id"],
      firstName: json["first_name"],
      middleName: json["middle_name"],
      lastName: json["last_name"],
      idNumber: json["id_number"],
      age: json["age"],
      phone: json["phone"],
      countryId: json["country_id"],
      cityId: json["city_id"],
      addressLine: json["address_line"],
      email: json["email"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      confirmationToken: json["confirmation_token"],
      confirmedAt: DateTime.tryParse(json["confirmed_at"] ?? ""),
      resetTokenCreated: json["reset_token_created"],
      addPassword: json["add_password"],
      takeControl: json["take_control"],
    );
  }

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "id_number": idNumber,
    "age": age,
    "phone": phone,
    "country_id": countryId,
    "city_id": cityId,
    "address_line": addressLine,
    "email": email,
    "created_at": createdAt?.toIso8601String(),
    "confirmation_token": confirmationToken,
    "confirmed_at": confirmedAt?.toIso8601String(),
    "reset_token_created": resetTokenCreated,
    "add_password": addPassword,
    "take_control": takeControl,
  };

  @override
  String toString(){
    return "$patientId, $firstName, $middleName, $lastName, $idNumber, $age, $phone, $countryId, $cityId, $addressLine, $email, $createdAt, $confirmationToken, $confirmedAt, $resetTokenCreated, $addPassword, $takeControl, ";
  }
}