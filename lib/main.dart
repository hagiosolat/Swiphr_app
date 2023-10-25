import 'package:flutter/material.dart';
import 'package:swiphr_app/screens/choose_vehicle.dart';
import 'package:swiphr_app/screens/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryElements),
        useMaterial3: true,
      ),
      home: const ChooseVehicle(),
    );
  }
}
