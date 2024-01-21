import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  final String image;
  final String text;
  const SecurityCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 10, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(209, 214, 214, 214)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image(image: AssetImage('assets/$image.png'))),
                const SizedBox(height: 15),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, color: Colors.amber),
                SizedBox(height: 40),
                Text(
                  'Closed',
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
