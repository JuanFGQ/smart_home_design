import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final IconData icons;
  final Color backGroundColor;
  const RoundedIcon(
      {super.key, required this.icons, required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.12,
      height: size.height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backGroundColor,
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                color: Colors.grey,
                offset: Offset(-1, 1))
          ]),
      child: Icon(
        icons,
        size: size.height * 0.03,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
