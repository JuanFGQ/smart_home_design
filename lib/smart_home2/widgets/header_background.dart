import 'package:flutter/material.dart';

class BackGroundHeader extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final String image;

  const BackGroundHeader(
      {super.key,
      required this.widget1,
      required this.widget2,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$image.png'), fit: BoxFit.cover)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color.fromARGB(78, 255, 255, 255)],
                tileMode: TileMode.clamp,
                stops: [0.0, 1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [widget1, widget2],
        ),
      ),
    );
  }
}
