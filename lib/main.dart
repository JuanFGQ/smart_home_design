// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:smart_home_design/pages/details_page.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Material App', home: Scaffold(body: DetailsPage()));
//   }
// }

// This can help you get an idea on how to do it.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorSlider(),
    );
  }
}

class ColorSlider extends StatefulWidget {
  @override
  _ColorSliderState createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  double _sliderValue = 0.0;
  double _sliderValue2 = 0.0;
  Color _selectedColor = Colors.transparent;
  Color _selectedColor2 = Colors.transparent;

  void _updateColor(double value) {
    int index = (value * (timelineColors.length - 1)).round();
    setState(() {
      _sliderValue = value;
      _selectedColor = timelineColors[index];
    });
  }

  void _sliderColor(double value) {
    // int index = ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Slider Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: timelineColors,
                  stops: timelineStops,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: _updateColor,
                min: 0,
                max: 1,
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selected Color:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: dynamicGradientColors,
                  stops: [_sliderValue2, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Slider(
                value: _sliderValue2,
                onChanged: (value) {
                  setState(() {
                    _sliderValue2 = value;
                  });
                },
                min: 0,
                max: 1,
                activeColor: _selectedColor,
                inactiveColor: Colors.transparent,
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: 50,
              width: 50,
              color: _selectedColor,
            )
            // Container(width: 100, height: 50, color: _selectedColor),
          ],
        ),
      ),
    );
  }
}

List<Color> timelineColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
];

List<double> timelineStops = [
  0.0,
  0.25,
  0.5,
  0.75,
  1.0,
];
