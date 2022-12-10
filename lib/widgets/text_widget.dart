import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rafood/utils/Dimensiones.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final Color color;
  double size;
  double height;
  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.size == 0 ? Dimensiones.fuente18 : widget.size,
          height: widget.height),
    );
  }
}
