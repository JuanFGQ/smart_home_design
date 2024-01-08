import 'package:flutter/material.dart';

class MyHourSelector extends StatefulWidget {
  @override
  _MyHourSelectorState createState() => _MyHourSelectorState();
}

class _MyHourSelectorState extends State<MyHourSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final ValueNotifier<bool> openHourPicker = ValueNotifier<bool>(false);
  final focusNode = FocusNode();

  //
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => showOverlay());

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
    //*final offset = renderBox.localToGlobal(Offset.zero);
    //
    entry = OverlayEntry(
        builder: (context) => Positioned(

            //this parameters was added only to see this overlay with testing purpose
            //*bottom: offset.dx + size.height + 10,
            //* left: offset.dy,
            //
            width: size.width,
            child: CompositedTransformFollower(
                link: layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 8),
                child: _CustomHourPicker(openHourPicker: openHourPicker))));

    overlay.insert(entry!);
  }

  void hideOverLay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Stack(
        children: [
          _ToogleButton(
            openHourPicker: openHourPicker,
            layerLink: layerLink,
          ),
          _CustomHourPicker(openHourPicker: openHourPicker),
        ],
      ),
    );
  }
}

class _CustomHourPicker extends StatelessWidget {
  const _CustomHourPicker({
    super.key,
    required this.openHourPicker,
  });

  final ValueNotifier<bool> openHourPicker;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: openHourPicker,
        builder: (context, value, child) {
          return Positioned(
            top: 40,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                width: 50,
                height: openHourPicker.value ? 150 : 0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          blurStyle: BlurStyle.inner,
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          spreadRadius: 2)
                    ]),
                child: ListView(
                  children: List.generate(
                      24,
                      (index) => GestureDetector(
                          onTap: () {
                            print('INDEX $index');
                            openHourPicker.value = false;
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('$index:00'),
                          )))),
                )),
          );
        });
  }
}

class _ToogleButton extends StatelessWidget {
  const _ToogleButton({
    super.key,
    required this.openHourPicker,
    this.layerLink,
  });

  final ValueNotifier<bool> openHourPicker;
  final LayerLink? layerLink;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink!,
      child: ValueListenableBuilder(
          valueListenable: openHourPicker,
          builder: (context, value, child) {
            return MaterialButton(
              elevation: 3,
              onPressed: () {
                openHourPicker.value = !openHourPicker.value;
                print(value);
                // Cambiar el estado para mostrar/ocultar la lista
              },
              child: const Icon(Icons.arrow_drop_down_circle_outlined),
            );
          }),
    );
  }
}
