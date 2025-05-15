class ResultEntity {
  final double probability;
  final String prediction;
  final String reportId;
  final double commPecentage;
  final double commScore;
  final double commTotal;
  final double physicalPecentage;
  final double physicalScore;
  final double physicalTotal;
  final double socialPecentage;
  final double socialScore;
  final double socialTotal;
  ResultEntity({
    required this.probability,
    required this.prediction,
    required this.reportId,
    required this.commPecentage,
    required this.commScore,
    required this.commTotal,
    required this.physicalPecentage,
    required this.physicalScore,
    required this.physicalTotal,
    required this.socialPecentage,
    required this.socialScore,
    required this.socialTotal,
  });
  factory ResultEntity.fromJson(json) {
    return ResultEntity(
      probability: json['probability']?.toDouble() ?? 0.0,
      prediction: json['prediction'] ?? '',
      reportId: json['report_id'] ?? '',
      commPecentage: json['comm_percentage']?.toDouble() ?? 0.0,
      commScore: json['comm_score']?.toDouble() ?? 0.0,
      commTotal: json['comm_total_weight']?.toDouble() ?? 0.0,
      physicalPecentage: json['physical_percentage']?.toDouble() ?? 0.0,
      physicalScore: json['physical_score']?.toDouble() ?? 0.0,
      physicalTotal: json['physical_total_weight']?.toDouble() ?? 0.0,
      socialPecentage: json['social_percentage']?.toDouble() ?? 0.0,
      socialScore: json['social_score']?.toDouble() ?? 0.0,
      socialTotal: json['social_total_weight']?.toDouble() ?? 0.0,
    );
  }
}
