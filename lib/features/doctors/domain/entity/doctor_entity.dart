import 'package:app/features/doctors/domain/entity/appointment_model.dart';

class DoctorModel {
  final String id;
  final String name;
  final String email;
  final dynamic phoneNumber;
  final String role;
  final String? identityVerification;
  final String? selfiePhoto;
  final String specialization;
  final String description;
  final String clinicLocation;
  final num rating;
  final List<AppointmentModel> appointments;
  final DateTime createdAt;
  final DateTime updatedAt;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.identityVerification,
    required this.selfiePhoto,
    required this.specialization,
    required this.description,
    required this.clinicLocation,
    required this.rating,
    required this.appointments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? json['_id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      role: json['role'] ?? '',
      identityVerification: json['identityVerification'],
      selfiePhoto: json['selfiePhoto'],
      specialization: json['specialization'] ?? '',
      description: json['description'] ?? '',
      clinicLocation: json['clinicLocation'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      appointments: (json['appointments'] as List<dynamic>).map((e) => AppointmentModel.fromJson(e)).toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
