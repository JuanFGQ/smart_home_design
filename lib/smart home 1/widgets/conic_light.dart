import 'package:flutter/material.dart';

class ConicLight extends StatefulWidget {
  @override
  _ConicLightState createState() => _ConicLightState();
}

class _ConicLightState extends State<ConicLight> {
  double _intensity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lámpara Controlada por Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: InvertedConePainter(_intensity),
              ),
            ),
            SizedBox(height: 20),
            Slider(
              value: _intensity,
              onChanged: (value) {
                setState(() {
                  _intensity = value;
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: '$_intensity',
            ),
          ],
        ),
      ),
    );
  }
}

class InvertedConePainter extends CustomPainter {
  final double intensity;

  InvertedConePainter(this.intensity);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color.fromARGB(0, 194, 183, 27),
          const Color.fromARGB(255, 254, 242, 133).withOpacity(intensity),
        ],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, 0), radius: size.height));

    final double centerX = size.width / 2;
    final double topY = 0.0;
    final double bottomY = size.height * intensity;

    final Path path = Path()
      ..moveTo(centerX, topY)
      ..lineTo(centerX + size.width / 4, bottomY)
      ..lineTo(centerX - size.width / 4, bottomY)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
