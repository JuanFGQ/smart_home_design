import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';
import 'package:smart_home_design/smart_home2/data/scenarios_data.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class LightsSubPage extends StatelessWidget {
  final List<LigthsInfo> lights;

  const LightsSubPage({super.key, required this.lights});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              mainAxisSpacing: 0.5,
              crossAxisCount: 2,
              crossAxisSpacing: 0),
          itemCount: lights.length,
          itemBuilder: (context, index) =>
              LightsCard(lighsInfo: lights[index])),
    );
  }
}

class LightsCard extends StatefulWidget {
  final LigthsInfo lighsInfo;

  const LightsCard({super.key, required this.lighsInfo});

  @override
  State<LightsCard> createState() => _LightsCardState();
}

class _LightsCardState extends State<LightsCard> {
  late bool _isActiveDevice = widget.lighsInfo.isActiveLamp;
  late double _sliderVal = widget.lighsInfo.dimmerValue ?? 0;
  double _lastValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turnOn = Provider.of<Model>(context);

    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: _isActiveDevice ? Colors.transparent : Colors.grey),
            borderRadius: BorderRadius.circular(20),
            color: _isActiveDevice ? const Color(0xff40bfcf) : Colors.white,
            gradient: _isActiveDevice
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color(0xff60a5fe),
                        Color(0xff78cafc),
                        Color(0xffa4e3ef),
                      ])
                : null,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey,
                  offset: Offset(-1, -1),
                  spreadRadius: 2.5)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: _isActiveDevice ? Colors.white : Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  shape: const CircleBorder(),
                  child: Icon(
                      _isActiveDevice ? Icons.light : Icons.light_outlined,
                      size: size.height * 0.04,
                      color: _isActiveDevice ? Colors.black : Colors.white),
                ),
                const Spacer(),
                Visibility(
                  visible:
                      widget.lighsInfo.isLedStripeActive != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: AvailableButton(
                        initialValue: _isActiveDevice,
                        backGroundColor: Colors.black,
                        quarterTurns: 1,
                        onChanged: (value) {
                          setState(() {
                            _isActiveDevice = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.lighsInfo.lampBrand,
                    style: TextStyle(fontSize: size.height * 0.015)),
                Text(widget.lighsInfo.lampLocation,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const Spacer(),
          Visibility(
            visible: widget.lighsInfo.isLedStripeActive != null ? false : true,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: AvailableButton(
                initialValue: _isActiveDevice,
                backGroundColor: Colors.black,
                quarterTurns: 0,
                onChanged: (value) {
                  setState(() {
                    _isActiveDevice = value;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.lighsInfo.isLedStripeActive != null ? true : false,
            child: AbsorbPointer(
              absorbing: !_isActiveDevice,
              child: Slider(
                secondaryActiveColor: Colors.grey,
                inactiveColor: Colors.grey,
                activeColor: _isActiveDevice
                    ? const Color.fromARGB(255, 4, 219, 247)
                    : Colors.white,
                value: _isActiveDevice ? _sliderVal : 0,
                onChanged: (value) {
                  _sliderVal = value;
                  _lastValue = _sliderVal;
                  setState(() {});
                },
              ),
            ),
          )
        ]));
  }
}
