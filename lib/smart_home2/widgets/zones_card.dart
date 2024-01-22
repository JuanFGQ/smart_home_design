import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/pages/details2.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/camera_sub_page.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class ZonesCard extends StatelessWidget {
  // final String zoneName;
  // final String quantityDevices;
  // final String temp;
  // final String humidity;
  // final String image;

  // const ZonesCard(
  //     {super.key,
  //     required this.zoneName,
  //     required this.quantityDevices,
  //     required this.temp,
  //     required this.humidity,
  //     required this.image});
  final ScenariosData data;

  const ZonesCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        final index = Provider.of<Model>(context, listen: false);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details2(data: data)));
        index.getIndex = 0;
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        height: size.height * 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                filterQuality: FilterQuality.low,
                image: AssetImage('assets/${data.image}.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(74, 50, 50, 50)),
            ),
            Positioned(
              top: 8,
              left: 10,
              child: Text(
                data.zoneName,
                style: TextStyle(
                    fontSize: size.height * 0.035,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: IconButton(
                  onPressed: () {
                    final camera = Provider.of<Model>(context, listen: false);
                    camera.getIndex = 1;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details2(
                                  data: data,
                                )));
                  },
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.white70,
                    size: size.width * 0.095,
                  )),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: _InfoBox(
                size: size,
                activeDevices: data.activeDevices,
                humidity: '26',
                temp: '15',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String temp;
  final String humidity;
  final String activeDevices;
  final Size size;

  const _InfoBox(
      {required this.temp,
      required this.humidity,
      required this.activeDevices,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 50,
      width: 200,
      // color: Colors.grey,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(140, 111, 111, 111)),
      child: Row(
        children: [
          const Icon(
            Icons.thermostat_outlined,
            color: Colors.white,
          ),
          Text(
            '$tempºC',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02),
          ),
          const VerticalDivider(
            endIndent: 15,
            indent: 15,
            color: Colors.white,
            width: 10,
            thickness: 2,
          ),
          Text('$humidity%',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02)),
          const SizedBox(width: 5),
          Text('Humidity',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02)),
          const Spacer(),
          Text('$activeDevices  Devices active',
              style: TextStyle(
                  color: Colors.greenAccent[100],
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.02)),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
