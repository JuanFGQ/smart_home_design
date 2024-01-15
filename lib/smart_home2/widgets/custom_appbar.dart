import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leadingIcon;
  final Widget text;
  final Widget? subTitle;
  final Function()? onPress;

  final Widget trailingWidget;

  const CustomAppBar(
      {super.key,
      required this.leadingIcon,
      required this.text,
      required this.trailingWidget,
      this.subTitle,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            color: Colors.white,
            height: 40,
            shape: const CircleBorder(
                side: BorderSide(width: 1, color: Colors.white)),
            onPressed: () {},
            child: IconButton(icon: Icon(leadingIcon), onPressed: onPress),
          ),
          Expanded(
            child: ListTile(
              title: text,
              subtitle: subTitle,
            ),
          ),
          trailingWidget
        ],
      ),
    );
  }
}
