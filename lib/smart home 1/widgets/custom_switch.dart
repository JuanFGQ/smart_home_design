import 'dart:math';

import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;

  late bool isActiveButton = false;

  late Tween<double> _move;
  late Tween<double> _rotate;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _yController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _move = Tween(begin: 0.0, end: 60 - 30);
    _rotate = Tween(begin: 0.0, end: pi * 2);
  }

  void toggleButton() {
    setState(() {
      isActiveButton = !isActiveButton;

      if (isActiveButton) {
        _xController.forward();
        _yController.forward();
      } else {
        _xController.reverse();
        _yController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleButton();
      },
      child: Stack(
        children: [
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 2.5,
                      color: Colors.grey,
                      offset: Offset(-1, -1),
                      blurRadius: 1.5)
                ]),
          ),
          AnimatedBuilder(
            animation: Listenable.merge([_xController, _yController]),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: isActiveButton
                  ? const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
            ),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(_move.evaluate(_xController))
                  ..rotateZ(_rotate.evaluate(_yController)),
                child: child,
              );
            },
          )
        ],
      ),
    );
  }
}
