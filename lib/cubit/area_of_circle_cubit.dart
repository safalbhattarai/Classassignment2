import 'package:bloc/bloc.dart';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0);

  void calculateArea(double radius) {
    double area = 3.1415 * radius * radius;
    emit(area); // Emit the calculated area to the view
  }
}
