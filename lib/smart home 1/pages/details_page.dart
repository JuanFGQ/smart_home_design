import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';
import 'package:smart_home_design/smart%20home%201/widgets/color_slider.dart';
import 'package:smart_home_design/smart%20home%201/widgets/hour_selector.dart';

final ValueNotifier<double> valueNotifier = ValueNotifier<double>(0.0);

class DetailsPage extends StatelessWidget {
  final String applianceName;
  final String image;
  const DetailsPage(
      {super.key, required this.applianceName, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              _LeftControlls(
                size: size,
                valueNotifier: valueNotifier,
                applianceName: applianceName,
              ),
              _ApplianceImage(
                size: size,
                valueNotifier: valueNotifier,
                image: image,
              ),
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
  final String applianceName;
  const _LeftControlls({
    super.key,
    required this.size,
    required this.valueNotifier,
    required this.applianceName,
  });

  final Size size;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.amber,
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
                child: Text(
                  applianceName,
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: primaryWordsColor),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: AvailableButton(
                quarterTurns: 4,
                initialValue: false,
                backGroundColor: switchBackGroundColor,
              ),
            ),
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

class _ApplianceImage extends StatelessWidget {
  final String image;
  const _ApplianceImage({
    super.key,
    required this.size,
    required this.valueNotifier,
    required this.image,
  });

  final Size size;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.60,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('assets/$image.png'),
            filterQuality: FilterQuality.high,
            alignment: Alignment.center,
          )),
          const SizedBox(height: 30),
          // Spacer(),
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
              const Text('Power',
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
