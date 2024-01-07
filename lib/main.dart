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

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHourSelector(),
  ));
}

class MyHourSelector extends StatefulWidget {
  @override
  _MyHourSelectorState createState() => _MyHourSelectorState();
}

class _MyHourSelectorState extends State<MyHourSelector>
    with SingleTickerProviderStateMixin {
  final int itemCount = 24;
  final double itemExtent = 50.0;
  final int initialHour = 12;
  bool isVisible = true; // Estado para controlar la visibilidad de la lista
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // scrollController.jumpTo(itemExtent * initialHour);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> openHourPicker = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hour Selector'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: openHourPicker,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    openHourPicker.value = !openHourPicker.value;
                    print(value);
                    // Cambiar el estado para mostrar/ocultar la lista
                  },
                  child: const Text('Show/Hide Hour Selector'),
                );
              }),
          // Lista de horas (se muestra si isVisible es verdadero)
          ValueListenableBuilder(
              valueListenable: openHourPicker,
              builder: (context, value, child) {
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                    width: 50,
                    height: openHourPicker.value ? 150 : 0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 50,
                              blurStyle: BlurStyle.inner,
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              spreadRadius: 2)
                        ]),
                    child: ListView(
                      children: List.generate(
                          24,
                          (index) => GestureDetector(
                              onTap: () {
                                print(index);
                              },
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text('$index:00'),
                              )))),
                    ));
              }),
        ],
      ),
    );
  }
}
