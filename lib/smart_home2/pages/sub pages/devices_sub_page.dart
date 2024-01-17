import 'package:flutter/material.dart';

class Devices extends StatelessWidget {
  const Devices({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No devices.\nAdd one!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.height * 0.02, color: Colors.grey)),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.add_box_outlined),
            ),
          ],
        )),
      ),
    );
  }
}
