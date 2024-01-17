import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/pages/camera_page.dart';
import 'package:smart_home_design/smart_home2/pages/details2.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/camera_sub_page.dart';

class CameraCard extends StatelessWidget {
  final String zoneName;
  final double sizeMultiplier;
  final BorderRadiusGeometry? radius;
  final double marginValue;
  final bool visible;

  const CameraCard(
      {super.key,
      required this.zoneName,
      required this.sizeMultiplier,
      this.radius,
      required this.marginValue,
      required this.visible});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (!visible) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(zoneName: zoneName),
              ));
        }
      },
      child: Container(
        margin: EdgeInsets.all(marginValue),
        // decoration: BoxDecoration(borderRadius: radius),
        width: double.infinity,
        height: size.height * sizeMultiplier,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: radius,
              child: const Image(
                filterQuality: FilterQuality.low,
                image: AssetImage('assets/cam2.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(74, 50, 50, 50)),
            ),
            Positioned(
              bottom: 8,
              left: 10,
              child: Container(
                // color: Colors.red,
                child: Row(
                  children: [
                    const _CameraIcon(),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          'Camera 2',
                          style: TextStyle(
                              // fontSize: size.height * 0.022,
                              color: Colors.white),
                        ),
                        Text(
                          '11:01:21',
                          style: TextStyle(
                              fontSize: size.height * 0.015,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 10,
                child: Container(
                  // height: 30,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Live',
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Visibility(
              visible: visible,
              child: Positioned(
                top: 50,
                child: MaterialButton(
                  color: const Color.fromARGB(147, 158, 158, 158),
                  height: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white38,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Positioned(
                top: 50,
                right: 0,
                child: MaterialButton(
                  color: const Color.fromARGB(147, 158, 158, 158),
                  height: 40,
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CameraIcon extends StatelessWidget {
  const _CameraIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // width: 50,
      // height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: const Icon(Icons.video_camera_back_outlined, color: Colors.white),
    );
  }
}
