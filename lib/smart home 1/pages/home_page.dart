import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart%20home%201/pages/details_page.dart';
import 'package:smart_home_design/smart%20home%201/widgets/home_appliance_card.dart';

import '../widgets/home_options_button.dart';
import '../widgets/side_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        }),
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/logo.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const _HeaderText(),
            // HomeZones(button: [
            //   OptionButton(
            //       icon: Icons.chair_outlined,
            //       text: 'Living room',
            //       onPress: () {}),
            //   OptionButton(
            //       icon: Icons.bed_outlined, text: 'Bedroom', onPress: () {}),
            //   OptionButton(
            //       icon: Icons.kitchen_outlined,
            //       text: 'Kitchen',
            //       onPress: () {}),
            //   OptionButton(
            //       icon: Icons.bathtub_outlined,
            //       text: 'Bathroom',
            //       onPress: () {}),
            //   OptionButton(
            //       icon: Icons.celebration_outlined,
            //       text: 'Discoteque',
            //       onPress: () {}),
            // ]),
            const _Devices(),
            _Content(),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 235,
              mainAxisSpacing: 5.0,
              crossAxisCount: 2,
              crossAxisSpacing: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}

class _Devices extends StatelessWidget {
  const _Devices({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Devices', style: subTitleStyle),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
              radius: 10,
              backgroundColor: componentsColor,
              child: Text(
                '4',
                style: TextStyle(color: textColor, fontSize: 12),
              )),
          const Spacer(),
          RotatedBox(
            quarterTurns: 1,
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              iconSize: 40,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'opcion1',
                    child: Text('Add new appliance'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'opcion2',
                    child: Text('Edit Appliance'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'opcion3',
                    child: Text('Delete'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      // height: size.height * 0.1,
      // color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi MobileX',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: size.width * 0.08),
            ),
            const Text(
              'Welcome to your smart home.',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
