import 'package:flutter/material.dart';

class Lights extends StatelessWidget {
  const Lights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 250,
              mainAxisSpacing: 1.0,
              crossAxisCount: 2,
              crossAxisSpacing: 0),
          itemCount: 6,
          itemBuilder: (context, index) => LightsCard()),
    );
  }
}

class LightsCard extends StatefulWidget {
  const LightsCard({super.key});

  @override
  State<LightsCard> createState() => _LightsCardState();
}

class _LightsCardState extends State<LightsCard> {
  bool _isActiveDevice = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.2,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Switch(
                value: _isActiveDevice,
                onChanged: (value) {
                  setState(() {
                    _isActiveDevice = !_isActiveDevice;
                    value = _isActiveDevice;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Main light',
                  style: TextStyle(fontSize: size.height * 0.02),
                ),
              )
            ],
          ),
          Expanded(child: Image(image: AssetImage('assets/lamp.png'))),
        ],
      ),
    );
  }
}
