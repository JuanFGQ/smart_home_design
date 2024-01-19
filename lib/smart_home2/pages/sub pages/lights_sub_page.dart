import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class LightsSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          //     Center(
          //   child: Expanded(
          //     child: ListView.builder(
          //       itemBuilder: (context, index) =>
          //           LightsCard(lampName: 'Kids room', lampImage: 'kidslamp'),
          //     ),
          //   ),
          // )

          GridView.builder(
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
  double _lastValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turnOn = Provider.of<Model>(context);

    return Container(
      margin: EdgeInsets.all(20),
      width: size.width * 0.5,
      height: size.height * 0.2,
      color: Colors.red,
      // margin: const EdgeInsets.all(15),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //       width: 2, color: _isActiveDevice ? Colors.black : Colors.grey),
      //   borderRadius: BorderRadius.circular(20),
      //   color: _isActiveDevice ? const Color(0xff40bfcf) : Colors.white,
      // ),
      // child:
    );
  }
}
