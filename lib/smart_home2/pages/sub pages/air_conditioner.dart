import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home_design/smart%20home%201/widgets/google_home_clone.dart';

import '../../widgets/custom_slider.dart';

class AirConditioner extends StatelessWidget {
  const AirConditioner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const _PowerScheduleButtons(),
          SizedBox(height: size.height * 0.07),
          const _Slider(),
          const Spacer(),
          const _FanSpeed(),
          const _ConditionerModes()
        ],
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomSlider();
  }
}

class _PowerScheduleButtons extends StatelessWidget {
  const _PowerScheduleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          height: 50,
          shape: const CircleBorder(),
          color: Colors.green,
          onPressed: () {},
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        ),
        MaterialButton(
          height: 50,
          shape: const CircleBorder(),
          color: Colors.white,
          onPressed: () {},
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.alarm,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class _FanSpeed extends StatelessWidget {
  const _FanSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Fan Speed',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.022)),
          Row(
            children: List.generate(
                6,
                (index) => Container(
                      margin: const EdgeInsets.only(top: 20, left: 5),
                      width: 50,
                      height: 20,
                      color: Colors.blue,
                    )),
          )
        ],
      ),
    );
  }
}

class _ConditionerModes extends StatelessWidget {
  const _ConditionerModes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.wb_sunny_outlined,
                  size: size.height * 0.045, color: Colors.grey)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.ac_unit,
                  size: size.height * 0.045, color: Colors.blue)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.water_drop_outlined,
                  size: size.height * 0.045, color: Colors.blue)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.air,
                  size: size.height * 0.045, color: Colors.grey)),
        ],
      ),
    ));
  }
}
