import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/widgets/rounded_icon.dart';

class AcModeCard extends StatefulWidget {
  final String mode;
  final IconData iconData;
  final void Function()? onPress;
  const AcModeCard(
      {super.key, required this.mode, required this.iconData, this.onPress});

  @override
  State<AcModeCard> createState() => _AcModeCardState();
}

class _AcModeCardState extends State<AcModeCard> {
  bool _isActiveCard = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _isActiveCard = !_isActiveCard;
        widget.onPress;
        setState(() {});
      },
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.14,
        decoration: BoxDecoration(
            gradient: _isActiveCard
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color(0xff60a5fe),
                        Color(0xff78cafc),
                        Color(0xffa4e3ef),
                      ])
                : null,
            border: _isActiveCard
                ? null
                : Border.all(
                    width: 1, color: Color.fromARGB(119, 158, 158, 158)),
            borderRadius: BorderRadius.circular(20),
            color: _isActiveCard ? null : Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIcon(
                icons: widget.iconData,
                backGroundColor: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                widget.mode,
                style: TextStyle(
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
