import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart%20home%201/widgets/home_options_button.dart';
import 'package:smart_home_design/smart_home2/pages/home2.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/air_conditioner.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/camera_sub_page.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/devices.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/lights.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';
import 'package:smart_home_design/smart_home2/widgets/custom_appbar.dart';

class Details2 extends StatelessWidget {
  final String zoneName;
  final String connectedDevices;
  // final String image;
  const Details2(
      {super.key, required this.zoneName, required this.connectedDevices});

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<Model>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _CustomAppBar(
                connectedDevices: connectedDevices,
                zoneName: zoneName,
                size: size),
            _TabBarButton(size: size),
            Expanded(
              child: IndexedStack(index: index.getIndex, children: [
                AirConditioner(),
                CamerasSubPage(zoneName: zoneName),
                Lights(),
                Devices(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
    required this.connectedDevices,
    required this.zoneName,
    required this.size,
  });

  final String connectedDevices;
  final String zoneName;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      subTitle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.circle,
            color: Colors.green,
            size: 10,
          ),
          Text('  $connectedDevices Devices')
        ],
      ),
      leadingIcon: Icons.arrow_back,
      onPress: () {
        Navigator.pop(context);
      },
      text: Center(
          child: Text(
        zoneName,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: size.width * 0.055),
      )),
      trailingWidget: MaterialButton(
        color: Colors.white,
        // height: 40,
        shape:
            const CircleBorder(side: BorderSide(width: 1, color: Colors.white)),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TabBarButton extends StatelessWidget {
  const _TabBarButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // color: Colors.red,
      width: double.infinity,
      height: size.height * 0.15,
      child: HomeZones(button: [
        OptionButton(icon: Icons.ac_unit, text: 'AC'),
        OptionButton(icon: Icons.videocam_outlined, text: 'Cameras'),
        OptionButton(icon: Icons.light, text: 'Lights'),
        OptionButton(icon: Icons.devices, text: 'devices'),
      ]),
    );
  }
}
