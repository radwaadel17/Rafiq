class AppointmentModel {
  final String day;
  final bool available;
  final String morning;
  final String evening;
  final String id;

  AppointmentModel({
    required this.day,
    required this.available,
    required this.morning,
    required this.evening,
    required this.id,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      day: json['day'] ?? '',
      available: json['available'] ?? false,
      morning: json['morning'] ?? '',
      evening: json['evening'] ?? '',
      id: json['id'] ?? json['_id'],
    );
  }
}
