// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/dashboard_cubit.dart';
//
// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Safal Dashboard'),
//         centerTitle: true,
//         backgroundColor: Colors.teal[700],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.teal],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 16.0,
//               mainAxisSpacing: 16.0,
//               childAspectRatio: 1.0,
//             ),
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   final dashboardCubit = context.read<DashboardCubit>();
//                   switch (index) {
//                     case 0:
//                       dashboardCubit.openAreaOfCircleView(context);
//                       break;
//                     case 1:
//                       dashboardCubit.openSimpleInterestView(context);
//                       break;
//                     case 2:
//                       dashboardCubit.openBMIView(context);
//                       break;
//                   }
//                 },
//                 child: Card(
//                   elevation: 8.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   color: Colors.white,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         index == 0
//                             ? Icons.circle
//                             : index == 1
//                                 ? Icons.monetization_on
//                                 : Icons.accessibility_new,
//                         size: 60,
//                         color: Colors.teal[700],
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         index == 0
//                             ? 'Area of Circle'
//                             : index == 1
//                                 ? 'Simple Interest'
//                                 : 'BMI Calculator',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.teal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safal Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // First row: Area of Circle and Simple Interest
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.circle,
                    title: 'Area of Circle',
                    onTap: () => context.read<DashboardCubit>().openAreaOfCircleView(context),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.monetization_on,
                    title: 'Simple Interest',
                    onTap: () => context.read<DashboardCubit>().openSimpleInterestView(context),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Space between rows
              // Second row: BMI Calculator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.accessibility_new,
                    title: 'BMI Calculator',
                    onTap: () => context.read<DashboardCubit>().openBMIView(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust size dynamically
      height: 120, // Fixed height for uniform button size
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: Colors.teal[700],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







