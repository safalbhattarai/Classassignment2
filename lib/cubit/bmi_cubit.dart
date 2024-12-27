import 'package:bloc/bloc.dart';

class BMICubit extends Cubit<Map<String, dynamic>> {
  BMICubit() : super({'bmi': 0.0, 'category': 'Unknown'});

  void calculateBMI(double weight, double heightCm) {
    double heightM = heightCm / 100;
    double bmi = weight / (heightM * heightM);
    String category;

    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      category = 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      category = 'Overweight';
    } else {
      category = 'Obesity';
    }

    emit({'bmi': bmi, 'category': category});
  }
}
