import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliderWidget extends StatefulWidget {
  const CustomSliderWidget({super.key});

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  GlobalKey key = GlobalKey();
  double angle = 0.0;
  double angle2 = 0.0;
  Offset center = Offset(0.0, 0.0);
  double circleSize = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (key.currentContext?.size != null) {
        Size size = key.currentContext!.size!;
        center = Offset(size.width / 2, size.height / 2);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
          color: Colors.grey,
          height: 250,
          width: 250,
          child: CustomPaint(
            painter: SliderPainter(circleSize, angle, angle2),
          ),
        ),
      ),
      GestureDetector(
        key: key,
        onPanDown: (details) {
          print('PAN DOWN  $details');

          // double x, y;
          // x = details.localPosition.dx - center.dx;
          // y = details.localPosition.dy - center.dy;
          // angle = atan2(y, x);
          angle = calculateAngle(details.localPosition, center);

          setState(() {});
        },
        onPanUpdate: (details) {
          print('PAN UPDATE  ${details.localPosition.dx}');

          // double x, y;
          // x = details.localPosition.dx - center.dx;
          // y = details.localPosition.dy - center.dy;
          // angle = atan2(y, x);
          angle = calculateAngle(details.localPosition, center);

          print('CALCULATED ANGLE $details');

          setState(() {});
        },
        onPanEnd: (details) {},
      )
    ]);
  }

  double calculateAngle(Offset position, Offset center) {
    double x = position.dx - center.dx;
    double y = position.dy - center.dy;
    double calculatedAngle = atan2(y, x);

    // Ajustar el ángulo para que esté en el rango correcto
    if (calculatedAngle < 0) {
      calculatedAngle += 2 * pi;
    }

    // calculatedAngle *= -1;

    // Limitar el ángulo al rango del drawBackGround
    if (calculatedAngle < pi / 2 || calculatedAngle > 3 * pi / 2) {
      calculatedAngle = pi / 2;
    } else if (calculatedAngle > 3 * pi / 2) {
      calculatedAngle = 3 * pi / 2;
    }

    return calculatedAngle;
  }
}

class SliderPainter extends CustomPainter {
  final double circleSize;
  final double angle;
  final double angle2;

  SliderPainter(this.circleSize, this.angle, this.angle2);
  @override
  void paint(Canvas canvas, Size size) {
    drawBackGround(canvas, size);
    drawSlider(canvas, size, angle);
    drawCircle(canvas, size, angle);
  }

  drawBackGround(Canvas canvas, Size size) {
    double width, height;

    width = (size.width);
    height = (size.height);

    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    //
    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height;

    //
    Rect rect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);
    //draw a circle on canvas
    canvas.drawArc(rect, 3 * pi / 2, pi, false, paint);
  }

  drawSlider(Canvas canvas, Size size, double angle) {
    // if (angle < 0) {
    //   angle += 2 * pi;
    // }

    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height;

    double startAngle = 3 * pi / 2;
    double endAngle = startAngle - angle;

    //
    Rect rect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    Paint paint = Paint();
    paint.color = Colors.cyan;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 10;

    canvas.drawArc(rect, -startAngle, endAngle, false, paint);
    //3.2
  }

  drawCircle(Canvas canvas, Size size, double angle) {
    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height;

    double xP = centerX - radius * cos(-angle);
    double yP = centerY - radius * sin(-angle);

    Paint paint = Paint();
    paint.color = Colors.cyan;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    //draw a circle on canvas
    print('COORDS $xP $yP');
    canvas.drawCircle(Offset(xP, yP), 10.0, paint);
  }

  @override
  bool shouldRepaint(SliderPainter oldDelegate) => true;
}
