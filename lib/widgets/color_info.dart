import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that displays information about a color
/// and allows copying the color code to clipboard.
class ColorInfo extends StatefulWidget {
  /// The text color to display information about.
  final String textColor;

  /// Creates a new [ColorInfo] widget.
  ///
  /// The [textColor] parameter must not be null.
  const ColorInfo({
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  State<ColorInfo> createState() => _ColorInfoState();
}

class _ColorInfoState extends State<ColorInfo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: _copyToClipboard,
        child: Center(
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.invert_colors_on),
                Text(widget.textColor.toUpperCase()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Copies the color code to clipboard and shows a snackbar with a success msg.
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.textColor.toUpperCase()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Text copied to clipboard!'),
      ),
    );
  }
}
