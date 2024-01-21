import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomSlider extends StatelessWidget {
  final double initialValue;
  final String currentTemp;
  const CustomSlider(
      {super.key, required this.initialValue, required this.currentTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      // color: Colors.red,
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          size: MediaQuery.of(context).size.width * 0.5,
          customColors: CustomSliderColors(
            trackColor: Colors.grey.shade300,
            progressBarColor: Colors.blue,
            dotColor: Colors.blue,
            shadowColor: Colors.grey.shade600,
          ),
          customWidths: CustomSliderWidths(
            trackWidth: 8,
            progressBarWidth: 5,
            handlerSize: 10,
          ),
        ),
        min: 0,
        max: 30,
        initialValue: initialValue,
        onChange: (value) => {},
        innerWidget: (double value) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              Text(
                '${value.round()}º',
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 42,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Current $currentTempºC',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}
