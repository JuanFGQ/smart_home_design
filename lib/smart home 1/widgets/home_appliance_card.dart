import 'package:flutter/material.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart%20home%201/pages/details_page.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';

class HomeApplianceCard extends StatelessWidget {
  final String assetImage;
  final String itemName;

  final String value;
  final IconData icon;
  const HomeApplianceCard(
      {super.key,
      required this.assetImage,
      required this.value,
      required this.icon,
      required this.itemName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              applianceName: itemName, image: assetImage),
                        ));
                  },
                  child: Image(image: AssetImage('assets/$assetImage.png'))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _ApplianceInfo(itemName: itemName, icon: icon, value: value),
                const SizedBox(width: 10),
                const Expanded(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: AvailableButton(
                        quarterTurns: 3,
                        initialValue: false,
                        backGroundColor: backGroundColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ApplianceInfo extends StatelessWidget {
  const _ApplianceInfo({
    super.key,
    required this.itemName,
    required this.icon,
    required this.value,
  });

  final String itemName;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(itemName,
                  overflow: TextOverflow.ellipsis, style: cardTextStyle)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(value,
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'On',
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
