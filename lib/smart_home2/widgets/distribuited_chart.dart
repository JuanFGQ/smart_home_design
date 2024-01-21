import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/helper/overlay_mixin.dart';

import '../data/energy_usage_data.dart';

class DistributedGraphicChart extends StatelessWidget {
  const DistributedGraphicChart({super.key, required this.dataset});

  final List<EnergyUsageData> dataset;
  List<double> get amounts => dataset.map((data) => data.kWh).toList();
  double get maxAmount => amounts.reduce((a, b) => a > b ? a : b);
  double get scale => maxAmount / 3;
  List<String> get horizontalLabels =>
      dataset.map((data) => data.dayName).toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(width: 2, color: Colors.black12),
        color: const Color(0xfff6f5ff),
        borderRadius: BorderRadius.circular(20),
      ),
      height: size.height * 0.35,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(horizontalLabels.length, (index) {
          final consumtionHeight =
              (dataset[index].kWh / maxAmount) * size.height * 0.27;

          return Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Text(horizontalLabels[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                  // color: Colors.red,
                  height: size.height * 0.3,
                  child: _Bar(
                      kWh: consumtionHeight,
                      price: dataset[index].price.toString(),
                      quantity: dataset[index].kWh.toString()))
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _Bar extends StatefulWidget {
  final double kWh;
  final String price;
  final String quantity;
  const _Bar(
      {super.key,
      required this.kWh,
      required this.price,
      required this.quantity});

  @override
  State<_Bar> createState() => __BarState();
}

class __BarState extends State<_Bar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _kWh;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _kWh = Tween<double>(begin: 0, end: widget.kWh)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          verticalDirection: VerticalDirection.up,
          children: [
            _StickBar(
              value: _kWh.value,
              barColor: const Color.fromARGB(255, 127, 172, 250),
              price: widget.price,
              quantity: widget.quantity,
            ),
          ],
        );
      },
    );
  }
}

class _StickBar extends StatefulWidget {
  final double value;
  final Color barColor;

  final String price;
  final String quantity;
  const _StickBar(
      {super.key,
      required this.value,
      required this.barColor,
      required this.price,
      required this.quantity});

  @override
  State<_StickBar> createState() => _StickBarState();
}

class _StickBarState extends State<_StickBar> with OverlayStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TapRegion(
      onTapOutside: (_) => removeOverlay(),
      child: GestureDetector(
        onTapDown: (details) => _onTapDow(details, context),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: widget.value,
          width: size.width * 0.07,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Color(0xff7f85f9)),
        ),
      ),
    );
  }

  void _onTapDow(TapDownDetails details, BuildContext context) {
    late Offset offset;
    if (details.globalPosition > const Offset(50, 0)) {
      offset = details.globalPosition - const Offset(50, 0);
    } else {
      offset = details.globalPosition;
    }
    toggleOverlay(
      OverlayUI(
          quantity: widget.quantity,
          price: widget.price,
          borderColor: widget.barColor),
      offset,
    );
  }
}

class OverlayUI extends StatelessWidget {
  final Color borderColor;
  final String price;
  final String quantity;
  const OverlayUI(
      {super.key,
      required this.borderColor,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8)),
          color: Color.fromARGB(160, 96, 207, 124)),
      child: Column(
        children: [
          Text('$quantity kWh',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black)),
          Text('\$$price',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
