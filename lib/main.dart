import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/pages/details_page.dart';
import 'package:smart_home_design/smart%20home%201/pages/home_page.dart';
import 'package:smart_home_design/smart%20home%201/widgets/available_button.dart';
import 'package:smart_home_design/smart%20home%201/widgets/custom_switch.dart';
import 'package:smart_home_design/smart_home2/pages/details2.dart';
import 'package:smart_home_design/smart_home2/pages/home2.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Model())],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Color(0xff1f1f1f),
            body: Center(child: Home2()
                // Details2(zoneName: 'Living Room', connectedDevices: '7'),
                ),
          )),
    );
  }
}
