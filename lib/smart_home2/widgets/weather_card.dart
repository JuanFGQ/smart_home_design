import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String weather;
  final String temp;
  final IconData icon;
  const WeatherCard(
      {super.key,
      required this.weather,
      required this.temp,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.only(top,le),
      width: size.width * 0.25,
      height: size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: size.width * 0.12, color: Colors.blue),
          ),
          const SizedBox(height: 5),
          Text(temp,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.019)),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(weather,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.019,
                    color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
