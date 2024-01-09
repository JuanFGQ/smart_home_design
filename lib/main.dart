// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:smart_home_design/pages/details_page.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Material App', home: Scaffold(body: DetailsPage()));
//   }
// }

// This can help you get an idea on how to do it.

import 'package:flutter/material.dart';
import 'package:smart_home_design/pages/details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DetailsPage());
  }
}
