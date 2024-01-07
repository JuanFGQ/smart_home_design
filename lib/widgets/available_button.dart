import 'dart:math';

import 'package:flutter/material.dart';

class AvailableButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const AvailableButton({
    super.key,
    required this.initialValue,
    this.onChanged,
  });
  @override
  State<AvailableButton> createState() => _AvailableButtonState();
}

class _AvailableButtonState extends State<AvailableButton>
    with TickerProviderStateMixin {
  late bool isActiveButton = widget.initialValue;

  //
  late AnimationController _xController;
  late AnimationController _yController;

  late Tween<double> _rotate;

  late Tween<double> _moveRight;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _yController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _moveRight = Tween(begin: 0.0, end: 60.0 - 30.0);

    _rotate = Tween<double>(begin: 0.0, end: pi * 2);
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

      if (widget.onChanged != null) {
        widget.onChanged!(isActiveButton);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _xController.dispose();
    _yController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isActiveButton) {
      setState(() {
        _xController.forward();
        _yController.forward();
      });
    }
    Offset distance = const Offset(1, 1);
    double blur = 1.5;
    return GestureDetector(
      onTap: toggleButton,
      child: Stack(
        children: [
          Container(
              // color: Colors.red,
              // margin: const EdgeInsets.only(right: 20),
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: blur,
                      color: Colors.grey,
                      offset: -distance,
                    ),
                  ])),
          AnimatedBuilder(
            animation: Listenable.merge([_xController, _yController]),
            child: _InsideBall(
              height: 20,
              width: 20,
              isAvailable: isActiveButton,
            ),
            builder: (context, Widget? internBall) {
              return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(_moveRight.evaluate(_xController))
                    ..rotateZ(_rotate.evaluate(_yController)),
                  child: internBall);
            },
          ),
        ],
      ),
    );
  }
}

class _InsideBall extends StatelessWidget {
  final double width;
  final double height;

  final bool isAvailable;
  const _InsideBall(
      {required this.isAvailable, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: isAvailable
          ? const Icon(Icons.check_circle_outline_outlined, color: Colors.green)
          : const Icon(Icons.cancel_outlined, color: Colors.red),
    );
  }
}
