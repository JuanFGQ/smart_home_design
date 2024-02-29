import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home_design/smart_home2/widgets/ac_mode_card.dart';

import '../../widgets/custom_slider.dart';

class AirConditioner extends StatelessWidget {
  final String mode;
  final String zoneName;

  final String currentTemp;
  final bool isActiveUnit;
  final double temp;

  const AirConditioner(
      {super.key,
      required this.mode,
      required this.currentTemp,
      required this.temp,
      required this.zoneName,
      required this.isActiveUnit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          _Slider(initialValue: temp, currentTemp: currentTemp),
          Column(
            children: [
              Text(
                'Mode',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: size.height * 0.018),
              ),
              const SizedBox(height: 10),
              Text(
                mode,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: size.height * 0.025),
              ),
            ],
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AcModeCard(iconData: Icons.ac_unit, mode: 'COLD'),
              AcModeCard(iconData: FontAwesomeIcons.fan, mode: 'FAN'),
              AcModeCard(iconData: Icons.water_drop_outlined, mode: 'DRY'),
            ],
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff60a5fe),
                      Color(0xff78cafc),
                      Color(0xffa4e3ef),
                    ])),
            child: FloatingActionButton.large(
                heroTag: '$zoneName',
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.power_settings_new_rounded, size: 50),
                backgroundColor: Colors.transparent),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final double initialValue;
  final String currentTemp;
  const _Slider({
    super.key,
    required this.initialValue,
    required this.currentTemp,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      currentTemp: currentTemp,
      initialValue: initialValue,
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
