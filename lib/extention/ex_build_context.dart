import 'package:flutter/material.dart';

Future<void> pushReplacement(BuildContext context, Widget page) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => page),
  );
}

extension ExBuildContext on BuildContext {
  Future<void> pushReplacement(Widget page) async {
    await Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
