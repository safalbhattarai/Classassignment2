import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/simple_interest_cubit.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController principalController = TextEditingController();
    TextEditingController rateController = TextEditingController();
    TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Safalbhattarai Class Assignment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              decoration: const InputDecoration(labelText: 'Principal'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(labelText: 'Rate of Interest'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(labelText: 'Time (years)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double principal = double.parse(principalController.text);
                double rate = double.parse(rateController.text);
                double time = double.parse(timeController.text);
                context.read<SimpleInterestCubit>().calculateSimpleInterest(principal, rate, time);
              },
              child: const Text('Calculate Simple Interest'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) {
                return Text('Simple Interest: \$${interest.toStringAsFixed(2)}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
