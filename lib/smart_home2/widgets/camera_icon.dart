import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: const Icon(Icons.video_camera_back_outlined, color: Colors.white),
    );
  }
}
