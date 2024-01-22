import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/pages/camera_page.dart';
import 'package:smart_home_design/smart_home2/pages/details2.dart';
import 'package:smart_home_design/smart_home2/pages/sub%20pages/camera_sub_page.dart';

import 'camera_icon.dart';

class CameraCard extends StatelessWidget {
  final CamerasInfo cameras;

  const CameraCard({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // if (!visible) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPage(
                  media: cameras.media,
                  cameraID: cameras.cameraID,
                  cameraTime: cameras.cameraTime,
                  isLiveCam: cameras.isLiveCamera),
            ));
        // }
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: size.height * 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: cameras.cameraID,
                child: Image(
                  filterQuality: FilterQuality.low,
                  image: AssetImage('assets/${cameras.media}.jpg'),
                  fit: BoxFit.fill,
                ),
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
                child: Row(
                  children: [
                    const CameraIcon(),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          cameras.cameraID,
                          style: TextStyle(
                              // fontSize: size.height * 0.022,
                              color: Colors.white),
                        ),
                        Text(
                          cameras.cameraTime,
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: cameras.isLiveCamera ? Colors.red : Colors.grey),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: cameras.isLiveCamera
                            ? Colors.white
                            : Colors.black54,
                        size: 15,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        cameras.isLiveCamera ? 'Online' : 'Offline',
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
