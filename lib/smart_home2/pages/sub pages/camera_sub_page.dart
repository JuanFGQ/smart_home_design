import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/camera%20card.dart';

class CamerasSubPage extends StatelessWidget {
  final String zoneName;

  const CamerasSubPage({super.key, required this.zoneName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'TAG$zoneName',
            child: CameraCard(
              visible: false,
              zoneName: zoneName,
              sizeMultiplier: 0.3,
              marginValue: 15,
              radius: BorderRadius.circular(20),
            ),
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  mainAxisSpacing: 1.0,
                  crossAxisCount: 2,
                  crossAxisSpacing: 0),
              itemCount: 6,
              itemBuilder: (context, index) => CameraCard(
                  radius: BorderRadius.circular(20),
                  zoneName: zoneName,
                  sizeMultiplier: 0.2,
                  marginValue: 15,
                  visible: false),
            ),
          )
        ],
      ),
    );
  }
}
