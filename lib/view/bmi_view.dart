import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/bmi_cubit.dart';

class BMIView extends StatelessWidget {
  const BMIView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double weight = double.parse(weightController.text);
                double height = double.parse(heightController.text);
                context.read<BMICubit>().calculateBMI(weight, height);
              },
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<BMICubit, Map<String, dynamic>>(
              builder: (context, state) {
                double bmi = state['bmi'];
                String category = state['category'];

                return Column(
                  children: [
                    Text(
                      'BMI: ${bmi.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Category: $category',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}