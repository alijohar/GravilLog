class PatientEntity {
  PatientEntity({
    required this.patientId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.idNumber,
    required this.age,
    required this.phone,
    required this.countryId,
    required this.cityId,
    required this.addressLine,
    required this.email,
    required this.createdAt,
    required this.confirmationToken,
    required this.confirmedAt,
    required this.resetTokenCreated,
    required this.addPassword,
    required this.takeControl,
  });

  final int? patientId;
  final String? firstName;
  final dynamic middleName;
  final dynamic lastName;
  final dynamic idNumber;
  final dynamic age;
  final dynamic phone;
  final int? countryId;
  final dynamic cityId;
  final dynamic addressLine;
  final String? email;
  final DateTime? createdAt;
  final String? confirmationToken;
  final DateTime? confirmedAt;
  final dynamic resetTokenCreated;
  final dynamic addPassword;
  final dynamic takeControl;

}