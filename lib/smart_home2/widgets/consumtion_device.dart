import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/rounded_icon.dart';

class ConsumtionDevice extends StatelessWidget {
  final IconData iconData;
  final String deviceName;
  final String price;
  final String kWh;
  const ConsumtionDevice(
      {super.key,
      required this.iconData,
      required this.deviceName,
      required this.price,
      required this.kWh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              RoundedIcon(
                icons: iconData,
                backGroundColor: Color(0xfff6f6f6),
              ),
              const SizedBox(width: 40),
              Text('$deviceName  (\$$price)',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              const Spacer(),
              Column(
                children: [
                  Text('$kWh',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  const Text('kWh',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey)),
                ],
              ),
            ],
          ),
          Divider(thickness: 1.2)
        ],
      ),
    );
  }
}
