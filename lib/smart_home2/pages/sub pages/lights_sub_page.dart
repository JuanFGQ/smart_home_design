import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class LightsSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 250,
              mainAxisSpacing: 1.0,
              crossAxisCount: 2,
              crossAxisSpacing: 0),
          itemCount: 1,
          itemBuilder: (context, index) => LightsCard(
                lampImage: 'lights',
                lampName: 'Wall Lamp',
              )),
    );
  }
}

class LightsCard extends StatefulWidget {
  final String lampName;
  final String lampImage;

  const LightsCard(
      {super.key, required this.lampName, required this.lampImage});

  @override
  State<LightsCard> createState() => _LightsCardState();
}

class _LightsCardState extends State<LightsCard> {
  bool _isActiveDevice = false;
  double _sliderVal = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turnOn = Provider.of<Model>(context);
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.2,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isActiveDevice ? const Color(0xff40bfcf) : Colors.white),
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            child: Column(
              children: [
                Switch(
                  activeColor:
                      _isActiveDevice ? Color(0xff00ff57) : Colors.grey,
                  inactiveThumbColor: Colors.grey,
                  value: _isActiveDevice,
                  onChanged: (value) {
                    setState(() {
                      _isActiveDevice = !_isActiveDevice;
                      value = _isActiveDevice;
                      turnOn.turnOnDevice(_isActiveDevice ? "on" : "off");
                    });
                  },
                ),
                SizedBox(
                  width: size.width * 0.01,
                  height: size.height * 0.2,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      inactiveColor: Colors.white,
                      activeColor: _isActiveDevice
                          ? const Color.fromARGB(255, 4, 219, 247)
                          : Colors.white,
                      value: _sliderVal,
                      onChanged: (value) {
                        _sliderVal = value;
                        setState(() {});
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                      //           // color: Colors.red,
                      width: size.width * 0.2,
                      height: size.height * 0.2,
                      child: Image(
                          image: AssetImage('assets/${widget.lampImage}.png'))),
                  Text(
                    'Wall Lamp',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isActiveDevice ? Colors.white : Colors.grey,
                        fontSize: size.height * 0.02),
                  ),
                  Expanded(
                    child: Text(
                      '${(_sliderVal * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isActiveDevice ? Colors.white : Colors.grey,
                        // fontSize: size.height * 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
