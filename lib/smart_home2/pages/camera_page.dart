import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/camera%20card.dart';

class CameraPage extends StatelessWidget {
  final String zoneName;

  const CameraPage({super.key, required this.zoneName});

  // final String image;
  // const CameraPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      body: Column(
        children: [
          Hero(
            tag: 'tag$zoneName',
            child: CameraCard(
              visible: true,
              marginValue: 5,
              radius: BorderRadius.circular(20),
              // radius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20)),
              zoneName: zoneName,
              sizeMultiplier: 0.8,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.16,
                  height: size.height * 0.16,
                  child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      child: Icon(Icons.camera_alt_outlined,
                          size: size.height * 0.04, color: Colors.white)),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: size.width * 0.2,
                  height: size.height * 0.2,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 104, 241, 108),
                    child: Icon(Icons.mic_none_rounded,
                        size: size.height * 0.04, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: size.width * 0.16,
                  height: size.height * 0.16,
                  child: FloatingActionButton(
                    mini: false,
                    onPressed: () {},
                    backgroundColor: Colors.black,
                    child: Icon(Icons.volume_down_outlined,
                        size: size.height * 0.04, color: Colors.white),
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
