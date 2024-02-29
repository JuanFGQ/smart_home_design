import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/constants2.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/widgets/side_drawer.dart';
import 'package:smart_home_design/smart_home2/widgets/weather_card.dart';
import 'package:smart_home_design/smart_home2/widgets/zones_card.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SideDrawer(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          _Grettins(size: size),
          _WeatherCard(size: size),
          SliverList(
              delegate: SliverChildListDelegate([
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: scenariosData.length,
                itemBuilder: (context, index) =>
                    ZonesCard(data: scenariosData[index]))
          ])),
        ],
      ),
    );
  }
}

class _Grettins extends StatelessWidget {
  const _Grettins({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
        elevation: 0,
        pinned: false,
        backgroundColor: Colors.white,
        flexibleSpace: _UserGretting());
  }
}

class _WeatherCard extends StatelessWidget {
  const _WeatherCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
        backgroundColor: Colors.white,
        floating: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
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
        ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.white,
      // expandedHeight: size.height * 0.05,
      floating: true,
      leading: IconButton(
          icon: const Icon(
            Icons.grid_view,
            color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }),
      centerTitle: true,
      title: const Text('15 devices Active'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/logo.png'),
          ),
        ),
      ],
    );
  }
}

class _UserGretting extends StatelessWidget {
  const _UserGretting({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(15),
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
            // minWidth: size.width * 0.09,
            height: size.height * 0.06,
            elevation: 1,
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
