import 'package:flutter/material.dart';

class ColorSlider extends StatefulWidget {
  final double height;
  final double width;

  const ColorSlider({super.key, required this.height, required this.width});

  @override
  _ColorSliderState createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  double _sliderValue = 0.0;
  double _sliderValue2 = 0.0;
  Color _selectedColor = Colors.transparent;
  Color _selectedColor2 = Colors.transparent;
  List<Color> dynamicGradientColors = [];

  List<Color> timelineColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];

  List<double> timelineStops = [0.0, 0.25, 0.5, 0.75, 1.0];

  void _updateColor(double value) {
    int index = (value * (timelineColors.length - 1)).round();
    setState(() {
      _sliderValue = value;
      _selectedColor = timelineColors[index];
      dynamicGradientColors =
          generateColorGradientList(_selectedColor, timelineColors.length);
    });
  }

  List<Color> generateColorGradientList(Color startColor, int length) {
    final List<Color> gradientList = [];

    for (int i = 0; i < length; i++) {
      final double ratio = i / (length - 1);
      gradientList.add(Color.lerp(startColor, Colors.white, ratio)!);
    }

    return gradientList;
  }

  @override
  void initState() {
    super.initState();
    _selectedColor = timelineColors.first;
    dynamicGradientColors =
        generateColorGradientList(_selectedColor, timelineColors.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widget.width,
            height: widget.height,
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
              thumbColor: Colors.transparent,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: dynamicGradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Slider(
              value: _sliderValue2,
              onChanged: (value) {
                setState(() {
                  _sliderValue2 = value;
                  _selectedColor2 = dynamicGradientColors[
                      (value * (dynamicGradientColors.length - 1)).round()];
                });
              },
              min: 0,
              max: 1,
              thumbColor: Colors.transparent,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
