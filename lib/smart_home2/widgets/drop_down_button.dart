import 'package:flutter/material.dart';

class MyCustomDropdownButton extends StatelessWidget {
  final String month;

  const MyCustomDropdownButton({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.06,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Text(month),
          PopupMenuButton<String>(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            icon: const Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'opcion1',
                child: Text('Monday'),
              ),
              const PopupMenuItem<String>(
                value: 'opcion2',
                child: Text('Tuesday'),
              ),
              const PopupMenuItem<String>(
                value: 'opcion3',
                child: Text('Wednesday'),
              ),
              const PopupMenuItem<String>(
                value: 'opcion3',
                child: Text('Thrusday'),
              ),
              const PopupMenuItem<String>(
                value: 'opcion3',
                child: Text('Friday'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
