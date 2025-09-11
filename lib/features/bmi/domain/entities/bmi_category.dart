enum BmiCategories {
  severeUnderweight(double.minPositive, 16),
  moderateUnderweight(16, 17),
  underweight(17, 18.5),
  normal(18.5, 25),
  overweight(25, 30),
  obeseClass1(30, 35),
  obeseClass2(35, 40),
  obeseClass3(40, double.infinity);

  final double min;
  final double max;

  const BmiCategories(this.min, this.max);

  static BmiCategories fromValue(double bmi) {
    return BmiCategories.values.firstWhere((element) => bmi >= element.min && bmi < element.max);
  }
}

class BmiCategory {
  BmiCategory({required this.category});

  final BmiCategories category;

  @override
  String toString() {
    switch (category) {
      case BmiCategories.severeUnderweight:
        return 'Severely underweight';
      case BmiCategories.moderateUnderweight:
        return 'Moderately underweight';
      case BmiCategories.underweight:
        return 'Underweight';
      case BmiCategories.normal:
        return 'Healthy';
      case BmiCategories.overweight:
        return 'Overweight';
      case BmiCategories.obeseClass1:
        return 'Obese class 1 (Mild)';
      case BmiCategories.obeseClass2:
        return 'Obese class 2 (Moderate)';
      case BmiCategories.obeseClass3:
        return 'Obese class 3 (Severe)';
    }
  }
}
