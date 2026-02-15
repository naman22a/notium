import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color defaultColor = primaryColor;
  late Color pickedColor;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.brown,
  ];

  @override
  void initState() {
    super.initState();
    pickedColor = defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pick Color'),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Select Color"),
                  content: SizedBox(
                    width: 300,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: colors.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (_, index) {
                        final color = colors[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              pickedColor = color;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black12),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(40.0),
            child: Container(
              height: 40,
              width: 40,
              color: pickedColor,
            ),
          ),
        ),
      ],
    );
  }
}
