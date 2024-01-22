import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';

class DevicesCard extends StatefulWidget {
  final OtherDevicesInfo devices;

  const DevicesCard({super.key, required this.devices});

  @override
  State<DevicesCard> createState() => _DevicesCardState();
}

class _DevicesCardState extends State<DevicesCard> {
  late bool _isActiveDevice = widget.devices.isActivedevice;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: _isActiveDevice ? Colors.transparent : Colors.grey),
            borderRadius: BorderRadius.circular(20),
            gradient: _isActiveDevice
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color(0xff8eebaa),
                        Color(0xffcce6dc),
                        Color(0xffcce6e5),
                      ])
                : null,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey,
                  offset: Offset(-1, -1),
                  spreadRadius: 2.5)
            ]),
        width: size.width * 0.35,
        height: size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.devices.deviceName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
            ),
            ImageIcon(AssetImage('assets/${widget.devices.icon}.png'),
                size: size.width * 0.15),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: AvailableButton(
                  onChanged: (value) {
                    _isActiveDevice = value;
                    setState(() {});
                  },
                  initialValue: _isActiveDevice,
                  backGroundColor: Colors.black,
                  quarterTurns: 0),
            )
          ],
        ));
  }
}
