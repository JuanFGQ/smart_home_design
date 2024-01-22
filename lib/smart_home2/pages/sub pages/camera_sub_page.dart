import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/widgets/camera%20card.dart';
import 'package:smart_home_design/smart_home2/widgets/sensors_card.dart';

class CamerasSubPage extends StatelessWidget {
  final String zoneName;
  final List<CamerasInfo> cameras;
  final List<SensorsInfo> sensors;

  const CamerasSubPage(
      {super.key,
      required this.zoneName,
      required this.cameras,
      required this.sensors});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: cameras.length,
              controller: PageController(viewportFraction: 0.9),
              itemBuilder: (context, index) {
                return CameraCard(cameras: cameras[index]);
              },
            ),
          ),
          Center(
            child: Text('Sensors',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.025)),
          ),
          Center(
            child: SizedBox(
              // width: size.width * 0.6,
              height: size.height * 0.2,
              child: ListView.builder(
                itemExtent: 80,
                itemCount: sensors.length,
                itemBuilder: (context, index) =>
                    SensorsCard(sensors: sensors[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
