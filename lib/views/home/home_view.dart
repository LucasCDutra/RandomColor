import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_color_solid_task/widgets/color_info.dart';

/// A StatefulWidget class that represents the first screen of the application.
class HomeView extends StatefulWidget {
  /// Default constructor of the class.
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Color _backgroundRgb;
  Color _fontColor = Colors.black;
  String _hexColor = '';

  @override
  void initState() {
    _changeBackgroundColorRandom();
    super.initState();
  }

  /// Builds the user interface of the application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackgroundColorRandom,
      child: Scaffold(
        backgroundColor: _backgroundRgb,
        body: Stack(
          children: [
            Center(
              child: Text(
                'Hey there',
                style: TextStyle(
                  color: _fontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ColorInfo(textColor: _hexColor),
          ],
        ),
      ),
    );
  }

  /// Changes the background color of the application to a random color.
  void _changeBackgroundColorRandom() {
    final int redInteger = Random().nextInt(256);
    final int greenInteger = Random().nextInt(256);
    final int blueInteger = Random().nextInt(256);

    setState(() {
      _hexColor = rgbToHex(redInteger, greenInteger, blueInteger);

      _fontColor =
          calculateLuminance(redInteger, greenInteger, blueInteger) > 0.5
              ? Colors.black
              : Colors.white;

      _backgroundRgb = Color.fromRGBO(
        redInteger,
        greenInteger,
        blueInteger,
        1,
      );
    });
  }

  /// Converts RGB color values to a hexadecimal color string.
  String rgbToHex(int r, int g, int b) {
    final String hexRed = r.toRadixString(16).padLeft(2, '0');
    final String hexGreen = g.toRadixString(16).padLeft(2, '0');
    final String hexBlue = b.toRadixString(16).padLeft(2, '0');
    return '#$hexRed$hexGreen$hexBlue';
  }

  /// Calculates the luminance of a given RGB color.
  ///
  /// The result is a value between 0 and 1, where 0 is black and 1 is white.
  double calculateLuminance(int r, int g, int b) {
    return (0.299 * r + 0.587 * g + 0.114 * b) / 255;
  }
}
