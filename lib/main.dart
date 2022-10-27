import 'package:body_mass_index/height_provider.dart';
import 'package:body_mass_index/home_page.dart';
import 'package:body_mass_index/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeightProvider>(
            create: (context) => WeightProvider()),
        ChangeNotifierProvider<HeightProvider>(
            create: (context) => HeightProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
