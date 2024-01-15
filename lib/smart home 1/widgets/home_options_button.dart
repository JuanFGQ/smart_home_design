import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';
import 'package:smart_home_design/smart_home2/provider/provider.dart';

class HomeZones extends StatelessWidget {
  final List<OptionButton> button;

  const HomeZones({
    super.key,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(button.length, (index) {
          print(index);
          return HomeOptionsButton(
            button: button[index],
            index: index,
          );
        }),
      ),
    );
  }
}

class HomeOptionsButton extends StatelessWidget {
  final OptionButton button;
  final int index;

  const HomeOptionsButton({
    super.key,
    required this.button,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getIn = Provider.of<Model>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: Column(
        children: [
          MaterialButton(
            elevation: 0,
            height: size.height * 0.1,
            onPressed: () {
              // selectedItem.value = index;

              getIn.getIndex = index;
            },
            shape: CircleBorder(
              side: BorderSide(
                  width: 2,
                  color:
                      // selectedItem.value
                      getIn.getIndex == index ? Colors.blue : Colors.white),
            ),
            color: Colors.white,
            // selectedItem.value == index ? componentsColor : null,
            child: Icon(button.icon,
                color:
                    // selectedItem.value
                    getIn.getIndex == index ? Colors.blue : Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            button.text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
