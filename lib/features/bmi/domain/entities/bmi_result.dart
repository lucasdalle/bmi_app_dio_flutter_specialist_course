import 'package:bmi_app/features/bmi/domain/entities/bmi_category.dart';

class BmiResult {
  BmiResult({required this.bmiValue, required this.resultCategory});

  final double bmiValue;
  final BmiCategory resultCategory;

  String getTip() {
    switch (resultCategory.category) {
      case BmiCategories.severeUnderweight:
        return 'Seek medical advice urgently – focus on safe weight gain and nutrition support';
      case BmiCategories.moderateUnderweight:
        return 'Increase calorie intake with balanced meals and consult a healthcare professional';
      case BmiCategories.underweight:
        return 'Add nutrient-dense snacks and monitor weight regularly';
      case BmiCategories.normal:
        return 'Maintain your healthy lifestyle with balanced diet and regular activity';
      case BmiCategories.overweight:
        return 'Incorporate more physical activity and choose lighter meal options';
      case BmiCategories.obeseClass1:
        return 'Focus on gradual weight loss through diet and exercise changes';
      case BmiCategories.obeseClass2:
        return 'Work with a healthcare provider on structured weight-loss strategies';
      case BmiCategories.obeseClass3:
        return 'Seek specialized medical guidance to reduce health risks';
    }
  }
}
