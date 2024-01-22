import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/widgets/devices_card.dart';

class Devices extends StatelessWidget {
  final List<OtherDevicesInfo> devicesInfo;
  const Devices({super.key, required this.devicesInfo});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              mainAxisSpacing: 0.5,
              crossAxisCount: 2,
              crossAxisSpacing: 0),
          itemCount: devicesInfo.length,
          itemBuilder: (context, index) => DevicesCard(
                devices: devicesInfo[index],
              )),
    );
  }
}
