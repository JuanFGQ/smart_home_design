import 'package:flutter/material.dart';
import 'package:smart_home_design/smart%20home%201/constants.dart';

class MyHourSelector extends StatefulWidget {
  final String text;
  final String showHour;

  const MyHourSelector({super.key, required this.text, required this.showHour});

  @override
  _MyHourSelectorState createState() => _MyHourSelectorState();
}

class _MyHourSelectorState extends State<MyHourSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late TextEditingController _textController;
  final ValueNotifier<bool> openHourPicker = ValueNotifier<bool>(false);
  final ValueNotifier<String> hourText = ValueNotifier<String>('');

  final focusNode = FocusNode();

  //
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => showOverlay());

    _textController = TextEditingController();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverLay();
      }
    });
  }

  void showOverlay() {
    final overlay = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;

    final size = renderBox.size;

    //test parameter
    /*
    the offset allows me to know the position of the widget and then 
    positioning the widget according to it 
    */
    // final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (context) => Positioned(
            width: 60,
            child: CompositedTransformFollower(
                link: layerLink,
                showWhenUnlinked: false,
                offset: Offset(10, size.height - 150),
                child: buildOverlay())));

    overlay.insert(entry!);
  }

  void hideOverLay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        child: Row(
          children: [
            Text(widget.text,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            ValueListenableBuilder(
                valueListenable: hourText,
                builder: (context, value, child) {
                  return Text(
                      hourText.value.isEmpty ? widget.showHour : hourText.value,
                      style: const TextStyle(
                          fontSize: 20,
                          color: primaryWordsColor,
                          fontWeight: FontWeight.bold));
                }),
            SizedBox(
              width: 50,
              child: CompositedTransformTarget(
                link: layerLink,
                child: ValueListenableBuilder(
                    valueListenable: openHourPicker,
                    builder: (context, value, child) {
                      return MaterialButton(
                        elevation: 3,
                        onPressed: () {
                          openHourPicker.value = !openHourPicker.value;

                          if (openHourPicker.value == true) {
                            showOverlay();
                          } else {
                            hideOverLay();
                          }

                          // Cambiar el estado para mostrar/ocultar la lista
                        },
                        child:
                            const Icon(Icons.arrow_drop_down_circle_outlined),
                      );
                    }),
              ),
            )
          ],
        ),
      );

  Widget buildOverlay() => Material(
        child: ValueListenableBuilder(
          valueListenable: openHourPicker,
          builder: (context, value, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceIn,
              // width: 50,
              height: openHourPicker.value ? 150 : 0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ValueListenableBuilder(
                valueListenable: hourText,
                builder: (context, value, child) {
                  return ListView(
                    children: List.generate(
                      24,
                      (index) => GestureDetector(
                        onTap: () {
                          print('INDEX $index');
                          hourText.value = '$index:00';
                          openHourPicker.value = false;
                          hideOverLay();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              '$index:00',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
}
