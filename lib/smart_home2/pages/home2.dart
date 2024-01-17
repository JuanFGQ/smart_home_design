import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/constants2.dart';
import 'package:smart_home_design/smart_home2/widgets/weather_card.dart';
import 'package:smart_home_design/smart_home2/widgets/zones_card.dart';

import '../widgets/custom_appbar.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(233, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              leadingIcon: Icons.grid_view_outlined,
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 15),
                  SizedBox(width: 5),
                  Text('15 Devices Running')
                ],
              ),
              trailingWidget: Padding(
                padding: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            _UserGretting(),
            SizedBox(height: size.height * 0.02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherCard(
                  temp: 'Temperature',
                  weather: '29ºC',
                  icon: Icons.thermostat_outlined,
                ),
                WeatherCard(
                  temp: 'Humidity',
                  weather: '72%',
                  icon: Icons.water_drop_outlined,
                ),
                WeatherCard(
                  temp: 'CO2',
                  weather: '602 PPM',
                  icon: Icons.cloud_queue,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return const ZonesCard(
                  humidity: '63',
                  temp: '26',
                  devicesConnected: false,
                  zoneName: 'Living Room',
                  quantityDevices: '10',
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

class _UserGretting extends StatelessWidget {
  const _UserGretting({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.green,
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi MobileX',
                style: TextStyle(
                    fontSize: size.height * 0.038,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'Welcome to your smart home',
                style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 120, 120, 120)),
              )
            ],
          ),
          MaterialButton(
            minWidth: 70,
            height: 40,
            elevation: 1,
            // minWidth: ,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: colorBlueSea,
            child: const Text(
              '+   Add',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
