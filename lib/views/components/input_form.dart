import 'package:flutter/material.dart';
import 'package:kurumo_stateful/util/color.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    this.decoration,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.icon,
  });

  final InputDecoration? decoration;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          fillColor: ColorManager.fillGray,
          filled: true,
          border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: ColorManager.textGray,
          ),
        ),
      ),
    );
    ;
  }
}
