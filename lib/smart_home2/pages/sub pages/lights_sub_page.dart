import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class LightsSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //     ListView.builder(
          //   itemBuilder: (context, index) =>
          //       LightsCard(lampName: 'Kids room', lampImage: 'kidslamp'),
          // )

          GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 220,
                  mainAxisSpacing: 0.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 0),
              itemCount: 4,
              itemBuilder: (context, index) => LightsCard(
                    icon: Icons.light_outlined,
                    roomName: 'kids room',
                    deviceName: 'Wall Lamp',
                  )),
    );
  }
}

// class LightsCard extends StatefulWidget {
//   final String lampName;
//   final String lampImage;

//   const LightsCard(
//       {super.key, required this.lampName, required this.lampImage});

//   @override
//   State<LightsCard> createState() => _LightsCardState();
// }

// class _LightsCardState extends State<LightsCard> {
//   bool _isActiveDevice = false;
//   double _sliderVal = 0;
//   double _lastValue = 0;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final turnOn = Provider.of<Model>(context);

//     return Container(
//       width: size.width * 0.5,
//       height: size.height * 0.2,
//       margin: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         border: Border.all(
//             width: 2, color: _isActiveDevice ? Colors.black : Colors.grey),
//         borderRadius: BorderRadius.circular(20),
//         color: _isActiveDevice ? const Color(0xff40bfcf) : Colors.white,
//       ),
//       child: Column(
//         children: [
//           Container(
//             // color: Colors.red,
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     Switch(
//                       activeColor:
//                           _isActiveDevice ? Color(0xff00ff57) : Colors.grey,
//                       inactiveThumbColor: Colors.grey,
//                       value: _isActiveDevice,
//                       onChanged: (value) {
//                         setState(() {
//                           _isActiveDevice = !_isActiveDevice;
//                           value = _isActiveDevice;
//                           turnOn.turnOnDevice(_isActiveDevice ? "on" : "off");
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       _isActiveDevice
//                           ? '${(_sliderVal * 100).toStringAsFixed(0)}%'
//                           : '${(_lastValue * 100).toStringAsFixed(0)}%',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: _isActiveDevice ? Colors.white : Colors.grey,
//                         fontSize: size.height * 0.03,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Wall Lamp',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: _isActiveDevice ? Colors.white : Colors.grey,
//                         fontSize: size.height * 0.02,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Container(
//                 //   // color: Colors.green,
//                 //   child: SizedBox(
//                 //     width: size.width * 0.19,
//                 //     height: size.height * 0.19,
//                 //     child: Image(
//                 //       filterQuality: FilterQuality.low,
//                 //       image: AssetImage('assets/${widget.lampImage}.png'),
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//           Flexible(
//             child: AbsorbPointer(
//               absorbing: !_isActiveDevice,
//               child: Slider(
//                 secondaryActiveColor: Colors.grey,
//                 inactiveColor: Colors.grey,
//                 activeColor: _isActiveDevice
//                     ? const Color.fromARGB(255, 4, 219, 247)
//                     : Colors.white,
//                 value: _isActiveDevice ? _sliderVal : 0,
//                 onChanged: (value) {
//                   _sliderVal = value;
//                   _lastValue = _sliderVal;
//                   setState(() {});
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class LightsCard extends StatefulWidget {
  final String deviceName;
  final bool? ledStripe;
  final bool? infoDataBool;

  final IconData icon;
  final String roomName;
  final String? infoData;

  const LightsCard({
    super.key,
    required this.deviceName,
    this.ledStripe,
    required this.icon,
    this.infoData,
    required this.roomName,
    this.infoDataBool,
  });

  @override
  State<LightsCard> createState() => _LightsCardState();
}

class _LightsCardState extends State<LightsCard> {
  bool _isActiveDevice = false;
  double _sliderVal = 0;
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
                  visible: widget.infoDataBool != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      widget.infoData ?? widget.infoData ?? '',
                      style: TextStyle(
                          fontSize: size.height * 0.04,
                          color: _isActiveDevice ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.ledStripe != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: AvailableButton(
                        initialValue: false,
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
                Text(widget.deviceName,
                    style: TextStyle(fontSize: size.height * 0.015)),
                Text(widget.deviceName,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const Spacer(),
          Visibility(
            visible: widget.ledStripe != null ? false : true,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: AvailableButton(
                initialValue: false,
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
            visible: widget.ledStripe != null ? true : false,
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
