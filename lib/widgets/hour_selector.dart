import 'package:flutter/material.dart';

class MyHourSelector extends StatefulWidget {
  @override
  _MyHourSelectorState createState() => _MyHourSelectorState();
}

class _MyHourSelectorState extends State<MyHourSelector>
    with SingleTickerProviderStateMixin {
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

    return Container(
      width: 50,
      // height: 50,
      // color: Colors.red,
      child: Stack(
        children: [
          _ToogleButton(openHourPicker: openHourPicker),
          _customHourPicker(openHourPicker: openHourPicker),
        ],
      ),
    );
  }
}

class _customHourPicker extends StatelessWidget {
  const _customHourPicker({
    super.key,
    required this.openHourPicker,
  });

  final ValueNotifier<bool> openHourPicker;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: openHourPicker,
        builder: (context, value, child) {
          return Positioned(
            top: 40,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                width: 50,
                height: openHourPicker.value ? 150 : 0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
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
                            print('INDEX $index');
                            openHourPicker.value = false;
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('$index:00'),
                          )))),
                )),
          );
        });
  }
}

class _ToogleButton extends StatelessWidget {
  const _ToogleButton({
    super.key,
    required this.openHourPicker,
  });

  final ValueNotifier<bool> openHourPicker;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: openHourPicker,
        builder: (context, value, child) {
          return MaterialButton(
            elevation: 3,
            onPressed: () {
              openHourPicker.value = !openHourPicker.value;
              print(value);
              // Cambiar el estado para mostrar/ocultar la lista
            },
            child: const Icon(Icons.arrow_drop_down_circle_outlined),
          );
        });
  }
}
