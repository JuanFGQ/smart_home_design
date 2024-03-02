import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/camera%20card.dart';

import '../widgets/camera_icon.dart';

class CameraPage extends StatelessWidget {
  final String media;
  final String cameraID;
  final String cameraTime;
  final bool isLiveCam;

  const CameraPage(
      {super.key,
      required this.media,
      required this.cameraID,
      required this.cameraTime,
      required this.isLiveCam});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff1f1f1f),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.8,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Hero(
                    tag: cameraID,
                    child: Image(
                      image: AssetImage('assets/${media}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                child: MaterialButton(
                  color: Color.fromARGB(196, 158, 158, 158),
                  height: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white38,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 0,
                child: MaterialButton(
                  color: Color.fromARGB(196, 158, 158, 158),
                  height: 40,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white38,
                  ),
                ),
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
                            cameraID,
                            style: TextStyle(
                                // fontSize: size.height * 0.022,
                                color: Colors.white),
                          ),
                          Text(
                            cameraTime,
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
                        color: isLiveCam ? Colors.red : Colors.grey),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: isLiveCam ? Colors.white : Colors.black54,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          isLiveCam ? 'Online' : 'Offline',
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Expanded(
                  flex: 1,
                  child: FloatingActionButton(
                      heroTag: 'TAG2$media',
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      child: Icon(Icons.camera_alt_outlined,
                          size: size.height * 0.04, color: Colors.white)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: FloatingActionButton(
                    heroTag: 'TAG$media',
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 104, 241, 108),
                    child: Icon(Icons.mic_none_rounded,
                        size: size.height * 0.04, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: FloatingActionButton(
                    heroTag: 'TAG3$media',
                    mini: false,
                    onPressed: () {},
                    backgroundColor: Colors.black,
                    child: Icon(Icons.volume_down_outlined,
                        size: size.height * 0.04, color: Colors.white),
                  ),
                ),
                Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
