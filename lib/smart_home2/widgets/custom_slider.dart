import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: MediaQuery.of(context).size.width * 0.6,
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
      initialValue: 15,
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
              'Current 21ºC',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
