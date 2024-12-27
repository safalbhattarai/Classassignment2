import 'package:bloc/bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0);

  void calculateSimpleInterest(double principal, double rate, double time) {
    double interest = (principal * rate * time) / 100;
    emit(interest); // Emit the calculated interest to the view
  }
}
