import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart%20home%201/widgets/home_options_button.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/air_conditioner.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/camera_sub_page.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/devices_sub_page.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/lights_sub_page.dart';
import 'package:smart_home_design/smart_home2/widgets/header_background.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';
import 'package:smart_home_design/smart_home2/widgets/custom_appbar.dart';

class Details2 extends StatelessWidget {
  final ScenariosData data;
  const Details2({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<Model>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackGroundHeader(
              image: data.image,
              widget1: _CustomAppBar(
                  connectedDevices: data.activeDevices,
                  zoneName: data.zoneName,
                  size: size),
              widget2: _TabBarButton(size: size, data: data),
            ),
            const Divider(endIndent: 40, indent: 40, thickness: 1),
            Expanded(
              child: IndexedStack(index: index.getIndex, children: [
                if (data.acUnitInfo != null)
                  AirConditioner(
                      currentTemp:
                          data.acUnitInfo?.currentTemp.toString() ?? '0',
                      isActiveUnit: data.acUnitInfo?.isActiveUnit ?? false,
                      mode: data.acUnitInfo?.unitMode ?? 'Cold',
                      temp: data.acUnitInfo?.currentTemp ?? 0,
                      zoneName: data.zoneName),
                CamerasSubPage(
                    zoneName: data.zoneName,
                    cameras: data.securityInfo,
                    sensors: data.sensors!),
                LightsSubPage(lights: data.lightsInfo),
                if (data.otherDeviceInfo != null)
                  Devices(devicesInfo: data.otherDeviceInfo!)
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
        shape:
            const CircleBorder(side: BorderSide(width: 1, color: Colors.white)),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TabBarButton extends StatelessWidget {
  final ScenariosData data;

  const _TabBarButton({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: size.height * 0.15,
      child: HomeZones(button: [
        if (data.acUnitInfo != null)
          OptionButton(icon: Icons.ac_unit, text: 'AC'),
        OptionButton(icon: Icons.videocam_outlined, text: 'Cameras'),
        OptionButton(icon: Icons.light, text: 'Lights'),
        OptionButton(icon: Icons.devices, text: 'devices'),
      ]),
    );
  }
}
