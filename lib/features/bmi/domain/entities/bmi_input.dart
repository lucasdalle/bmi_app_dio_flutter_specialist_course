class BmiInput {
  const BmiInput({this.weight = 0, this.height = 0, this.isMetric = true});

  final double weight;
  final double height;
  final bool isMetric;

  BmiInput copyWith({double? weight, double? height, bool? isMetric}) {
    return BmiInput(weight: weight ?? this.weight, height: height ?? this.height, isMetric: isMetric ?? this.isMetric);
  }
}
