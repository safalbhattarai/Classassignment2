import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/area_of_circle_cubit.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('safalbhattarai Class Assignment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double radius = double.parse(radiusController.text);
                context.read<AreaOfCircleCubit>().calculateArea(radius);
              },
              child: const Text('Calculate Area of Circle'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AreaOfCircleCubit, double>(
              builder: (context, area) {
                return Text('Area of Circle: ${area.toStringAsFixed(2)}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
