import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/camera%20card.dart';
import 'package:smart_home_design/smart_home2/widgets/security_card.dart';

class CamerasSubPage extends StatelessWidget {
  final String zoneName;

  const CamerasSubPage({super.key, required this.zoneName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                return CameraCard(
                  visible: false,
                  zoneName: zoneName,
                  sizeMultiplier: 0.3,
                  marginValue: 15,
                  radius: BorderRadius.circular(20),
                );
              },
            ),
          ),
          SizedBox(
            width: size.width * 1,
            height: size.height * 0.35,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170,
                    mainAxisSpacing: 1.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0),
                itemCount: 4,
                itemBuilder: (context, index) => const SecurityCard(
                      image: 'window_closed',
                      text: 'Windows',
                    )),
          )
        ],
      ),
    );
  }
}
