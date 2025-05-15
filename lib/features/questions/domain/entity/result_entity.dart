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
}
