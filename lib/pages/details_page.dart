import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home_design/widgets/available_button.dart';
import 'package:smart_home_design/widgets/hour_selector.dart';

final ValueNotifier<double> valueNotifier = ValueNotifier<double>(0.0);

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              _LeftControlls(
                size: size,
                valueNotifier: valueNotifier,
              ),
              _Lamps(
                size: size,
                valueNotifier: valueNotifier,
              ),
            ],
          ),
          Expanded(
              child: Container(
                  color: Colors.yellow,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text('Schedule',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          _SchedulePicker(text: 'From'),
                          SizedBox(
                            width: 20,
                          ),
                          _SchedulePicker(text: 'To'),
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
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
    return Container(
        width: size.width * 0.5,
        height: size.height * 0.75,
        // color: Colors.red,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: AvailableButton(initialValue: true)),
            const SizedBox(height: 60),
            Column(
              children: [
                const Text('Hight',
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
                Container(
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
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                    return Text(valueNotifier.value.toString().substring(0, 3),
                        style: const TextStyle(
                            fontSize: 46, fontWeight: FontWeight.normal));
                  }),
              const Text('Brightness',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}

class _SchedulePicker extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  const _SchedulePicker({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 8),
          const Text('12:00',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          // IconButton(
          //     onPressed: onpressed,
          //     icon: const Icon(Icons.keyboard_arrow_down_outlined))

          // MyHourSelector()
        ],
      ),
    );
  }
}
