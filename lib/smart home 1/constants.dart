import 'package:flutter/material.dart';
import 'package:smart_home_design/smart%20home%201/widgets/home_appliance_card.dart';

const secondaryWordsColor = Color.fromARGB(174, 0, 0, 0);
const primaryWordsColor = Colors.black;
const switchBackGroundColor = Color(0xfff3e4cb);
const componentsColor = Color(0xfff47b72);

const backGroundColor = Colors.white;
const textColor = Colors.white;

const subTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25);

const cardTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15);

class OptionButton {
  final IconData icon;
  final String text;
  final int? index;

  OptionButton({
    this.index,
    required this.icon,
    required this.text,
  });
}

final List<HomeApplianceCard> items = [
  const HomeApplianceCard(
    itemName: 'Smart Speaker',
    assetImage: 'smart',
    icon: Icons.volume_up_outlined,
    value: '46',
  ),
  const HomeApplianceCard(
    itemName: 'Air Conditioner',
    assetImage: 'conditioner',
    icon: Icons.air,
    value: '25 ºC',
  ),
  const HomeApplianceCard(
    itemName: 'Robot Vaccum',
    assetImage: 'vac',
    icon: Icons.battery_4_bar,
    value: '75',
  ),
  const HomeApplianceCard(
    itemName: 'Lights',
    assetImage: 'lights',
    icon: Icons.light_mode,
    value: '46 %',
  ),
];
