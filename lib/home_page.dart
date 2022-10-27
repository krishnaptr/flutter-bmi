import 'dart:math';

import 'package:body_mass_index/height_provider.dart';
import 'package:body_mass_index/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text(
                      'Apa itu Body Mass Index (BMI)?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Body Mass Index (BMI) adalah kalkulator sederhana untuk menghitung berat badan ideal berdasarkan tinggi dan berat badan. Dengan menggunakan kalkulator BMI, seseorang akan mengetahui apakah ia masuk dalam kategori berat badan ideal atau tidak.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Beratmu Berapa? (kg):',
                      style: TextStyle(fontSize: 20),
                    ),

                    // NOTE: MENGGUNAKAN CONSUMER
                    // Consumer<WeightProvider>(
                    //   builder: (context, weightProvider, child) => Slider(
                    //     min: 1,
                    //     max: 100,
                    //     divisions: 100,
                    //     label: weightProvider.weight.round().toString(),
                    //     value: weightProvider.weight,
                    //     onChanged: (newValue) {
                    //       newValue = newValue.roundToDouble();
                    //       print('weight: $newValue');
                    //       weightProvider.weight = newValue;
                    //     },
                    //   ),
                    // ),

                    Slider(
                      min: 1,
                      max: 100,
                      divisions: 100,
                      label: weightProvider.weight.round().toString(),
                      value: weightProvider.weight,
                      onChanged: (newValue) {
                        newValue = newValue.roundToDouble();
                        weightProvider.weight = newValue;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Tinggimu Berapa? (cm):',
                      style: TextStyle(fontSize: 20),
                    ),

                    // NOTE: MENGGUNAKAN CONSUMER
                    // Consumer<HeightProvider>(
                    //   builder: (context, heightProvider, child) => Slider(
                    //     min: 1,
                    //     max: 200,
                    //     divisions: 200,
                    //     value: heightProvider.height,
                    //     activeColor: Colors.pink,
                    //     label: heightProvider.height.round().toString(),
                    //     inactiveColor: Colors.pink.withOpacity(0.2),
                    //     onChanged: (newValue) {
                    //       newValue = newValue.roundToDouble();
                    //       heightProvider.height = newValue;
                    //     },
                    //   ),
                    // ),

                    Slider(
                      min: 1,
                      max: 200,
                      divisions: 200,
                      value: heightProvider.height,
                      activeColor: Colors.pink,
                      label: heightProvider.height.round().toString(),
                      inactiveColor: Colors.pink.withOpacity(0.2),
                      onChanged: (newValue) {
                        newValue = newValue.roundToDouble();
                        heightProvider.height = newValue;
                      },
                    ),
                  ],
                ),

                // NOTE: MENGGUNAKAN CONSUMER
                // Consumer<WeightProvider>(
                //   builder: (context, weightProvider, child) =>
                //       Consumer<HeightProvider>(
                //     builder: (context, heightProvider, child) => Text(
                //       'BMI mu adalah:\n ${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
                //       textAlign: TextAlign.center,
                //       style: const TextStyle(
                //           fontSize: 24, fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // )

                Column(
                  children: [
                    Text(
                      'BMI mu adalah:\n ${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Keterangan:',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      " Di bawah 18,5 = Berat badan kurang proporsional\n Di antara 18,5 – 22,9 = Berat badan ideal \n Di antara 23 – 29,9 = Berat badan berlebih (berpotensi obesitas) \n Di atas 30 = Obesitas",
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
