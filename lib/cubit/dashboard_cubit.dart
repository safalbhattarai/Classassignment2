import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'simple_interest_cubit.dart';
import 'area_of_circle_cubit.dart';
import 'bmi_cubit.dart';
import '../view/simple_interest_view.dart';
import '../view/area_of_circle_view.dart';
import '../view/bmi_view.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
      this._simpleInterestCubit,
      this._areaOfCircleCubit,
      this._bmiCubit,
      ) : super(null);

  final SimpleInterestCubit _simpleInterestCubit;
  final AreaOfCircleCubit _areaOfCircleCubit;
  final BMICubit _bmiCubit;

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: const SimpleInterestView(),
        ),
      ),
    );
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: const AreaOfCircleView(),
        ),
      ),
    );
  }

  void openBMIView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _bmiCubit,
          child: const BMIView(),
        ),
      ),
    );
  }
}
