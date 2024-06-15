import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Colorpicker extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;

  const Colorpicker(
      {super.key, required this.initialColor, required this.onColorChanged});

  @override
  _ColorpickerState createState() => _ColorpickerState();
}

class _ColorpickerState extends State<Colorpicker> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColorPicker(
        pickerColor: _currentColor,
        onColorChanged: (color) {
          setState(() {
            _currentColor = color;
          });
          widget.onColorChanged(color);
        },
        colorPickerWidth: 300.0,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        showLabel: true,
        paletteType: PaletteType.hsv,
        pickerAreaBorderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(2.0),
          topRight: const Radius.circular(2.0),
        ),
      ),
    );
  }
}
