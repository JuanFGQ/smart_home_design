import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';

class SensorsCard extends StatelessWidget {
  final SensorsInfo sensors;

  const SensorsCard({super.key, required this.sensors});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // margin: const EdgeInsets.only(left: 25, right: 10, bottom: 5),
      margin: EdgeInsets.all(15),
      // height: size.height * 0.15,
      // width: size.width * 0.1,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(209, 214, 214, 214)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
                width: 40,
                height: 45,
                child: Image(image: AssetImage('assets/${sensors.image}.png'))),
          ),
          SizedBox(width: 10),
          Text(
            sensors.sensorName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sensors.isActiveSensor ? 'Closed' : 'Open',
                  style: const TextStyle(color: Colors.grey),
                ),
                sensors.isActiveSensor
                    ? Icon(Icons.lock_outline, color: Colors.green)
                    : Icon(Icons.lock_open_outlined, color: Colors.red),
                // SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
