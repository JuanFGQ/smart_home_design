// class GoogleHomeClone extends StatefulWidget {
//   const GoogleHomeClone({Key? key}) : super(key: key);

//   @override
//   State<GoogleHomeClone> createState() => _GoogleHomeCloneState();
// }

// class _GoogleHomeCloneState extends State<GoogleHomeClone> {
//   var _isLampOn = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(
//           Icons.expand_more,
//           color: Colors.grey.shade700,
//         ),
//         actions: [
//           Icon(
//             Icons.settings,
//             color: Colors.grey.shade700,
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           Icon(
//             Icons.more_horiz,
//             color: Colors.grey.shade700,
//           ),
//           const SizedBox(
//             width: 15,
//           ),
//         ],
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 5),
//         child: Column(
//           children: [
//             const Text(
//               "Lamp",
//               style: TextStyle(fontSize: 32),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Living room",
//               style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
//             ),
//             const Spacer(),
//             SleekCircularSlider(
//               appearance: CircularSliderAppearance(
//                 size: MediaQuery.of(context).size.width * 0.84,
//                 customColors: CustomSliderColors(
//                   trackColor: Colors.grey.shade300,
//                   progressBarColor: _isLampOn ? Colors.amber : Colors.grey,
//                   dotColor: Colors.white,
//                   shadowColor: Colors.grey.shade600,
//                 ),
//                 customWidths: CustomSliderWidths(
//                   trackWidth: 5,
//                   progressBarWidth: 5,
//                   handlerSize: 10,
//                 ),
//               ),
//               min: 0,
//               max: 100,
//               initialValue: 68,
//               onChange: (value) => {},
//               innerWidget: (double value) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Spacer(),
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(boxShadow: [
//                             BoxShadow(
//                               color: _isLampOn
//                                   ? Colors.amber.shade200
//                                   : Colors.transparent,
//                               spreadRadius: 20,
//                               blurRadius: 200,
//                             ),
//                           ]),
//                           child: const Icon(
//                             Icons.power_settings_new,
//                             color: Colors.transparent,
//                             size: 32,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => {
//                             setState(() {
//                               _isLampOn = !_isLampOn;
//                             })
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 border: Border.all(color: Colors.grey.shade200),
//                                 borderRadius: BorderRadius.circular(50),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.shade400,
//                                     spreadRadius: 0.5,
//                                     blurRadius: 0.5,
//                                     offset: const Offset(0, 1.75),
//                                   ),
//                                 ]),
//                             child: Icon(
//                               Icons.power_settings_new,
//                               color: _isLampOn ? Colors.amber : Colors.grey,
//                               size: 32,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Text(
//                       _isLampOn ? '${value.round()}%' : 'Off',
//                       style: TextStyle(
//                           color:
//                               _isLampOn ? Colors.amber.shade600 : Colors.grey,
//                           fontSize: 42,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       'Brightness',
//                       style: TextStyle(
//                           color: _isLampOn
//                               ? Colors.amber.shade600
//                               : Colors.transparent,
//                           fontSize: 16),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 70,
//             ),
//             Container(
//               width: 110,
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey.shade400),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.color_lens,
//                     color: Colors.blue.shade700,
//                     size: 26,
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Text(
//                     "Color",
//                     style: TextStyle(
//                         color: Colors.blue.shade700,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500),
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Semicircular Slider',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Semicircular Slider'),
//         ),
//         body: Center(
//           child: SemicircularSlider(),
//         ),
//       ),
//     );
//   }
// }

// class SemicircularSlider extends StatefulWidget {
//   @override
//   _SemicircularSliderState createState() => _SemicircularSliderState();
// }

// class _SemicircularSliderState extends State<SemicircularSlider> {
//   double _sliderValue = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.rotationZ(pi / 2),
//       child: SleekCircularSlider(
//         min: 0,
//         max: 100,
//         initialValue: _sliderValue,
//         appearance: CircularSliderAppearance(
//           size: MediaQuery.of(context).size.width * 0.8,
//           startAngle: 90,
//           angleRange: 180,
//           customWidths: CustomSliderWidths(
//             progressBarWidth: 20,
//             shadowWidth: 20,
//           ),
//           customColors: CustomSliderColors(
//             trackColor: Colors.grey,
//             progressBarColor: Colors.blue,
//             shadowColor: Colors.blue.withOpacity(0.2),
//             dotColor: Colors.blue,
//           ),
//           infoProperties: InfoProperties(
//             mainLabelStyle: TextStyle(fontSize: 0.0, color: Colors.red),
//             modifier: (double value) {
//               return '';
//             },
//           ),
//         ),
//         onChangeEnd: (double value) {
//           setState(() {
//             _sliderValue = value;
//           });
//         },
//       ),
//     );
//   }
// }
