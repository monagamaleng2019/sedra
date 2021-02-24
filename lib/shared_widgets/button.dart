import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  Button(
      {@required this.backgroundColor,
      @required this.onPressed,
      @required this.label});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
