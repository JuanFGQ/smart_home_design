import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home_design/constants.dart';
import 'package:smart_home_design/widgets/available_button.dart';
import 'package:smart_home_design/widgets/color_slider.dart';
import 'package:smart_home_design/widgets/hour_selector.dart';

final ValueNotifier<double> valueNotifier = ValueNotifier<double>(0.0);

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              _LeftControlls(size: size, valueNotifier: valueNotifier),
              _Lamps(size: size, valueNotifier: valueNotifier),
            ],
          ),
          _ScheduleAndSliderColor(size: size),
        ],
      ),
    );
  }
}

class _ScheduleAndSliderColor extends StatelessWidget {
  const _ScheduleAndSliderColor({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text('Schedule',
                  style: TextStyle(
                      fontSize: 25,
                      color: primaryWordsColor,
                      fontWeight: FontWeight.bold)),
            ),
            const Row(
              children: [
                SizedBox(width: 40),
                MyHourSelector(text: 'From', showHour: '3:00'),
                SizedBox(width: 40),
                MyHourSelector(text: 'To', showHour: '19:00'),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text('Color',
                    style: TextStyle(
                        fontSize: 22,
                        color: primaryWordsColor,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            ColorSlider(height: 5, width: size.width * 0.85)
          ],
        ));
  }
}

class _LeftControlls extends StatelessWidget {
  const _LeftControlls({
    super.key,
    required this.size,
    required this.valueNotifier,
  });

  final Size size;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.black),
            const SizedBox(width: 10),
            Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 10, bottom: 10, right: 10),
                child: const Text(
                  'Smart Light',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryWordsColor),
                )),
            const Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: AvailableButton(
                  initialValue: true,
                  backGroundColor: switchBackGroundColor,
                )),
            const SizedBox(height: 60),
            Column(
              children: [
                const Text('High',
                    style: TextStyle(
                        fontSize: 20,
                        color: secondaryWordsColor,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: 80,
                  child: ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            divisions: 20,
                            inactiveColor:
                                const Color.fromARGB(169, 158, 158, 158),
                            activeColor: const Color(0xffad903a),
                            thumbColor: const Color.fromARGB(255, 221, 188, 1),
                            value: value,
                            onChanged: (value) {
                              valueNotifier.value = value;
                            },
                            min: 0,
                            max: 1,
                          ),
                        );
                      }),
                ),
                const Text('Low',
                    style: TextStyle(
                        fontSize: 20,
                        color: secondaryWordsColor,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ));
  }
}

class _Lamps extends StatelessWidget {
  const _Lamps({
    super.key,
    required this.size,
    required this.valueNotifier,
  });

  final Size size;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      height: size.height * 0.75,
      // color: Colors.blue,
      child: Column(
        children: [
          const Image(image: AssetImage('assets/lamp3.png')),
          const SizedBox(height: 30),
          Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) {
                    return Text(
                        '${(valueNotifier.value * 100).toStringAsFixed(0)}%',

                        // '${valueNotifier.value.toString().substring(0, 3)}%',
                        style: const TextStyle(
                            color: secondaryWordsColor,
                            fontSize: 46,
                            fontWeight: FontWeight.normal));
                  }),
              const Text('Brightness',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: primaryWordsColor)),
            ],
          )
        ],
      ),
    );
  }
}
