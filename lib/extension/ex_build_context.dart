import 'package:flutter/material.dart';

Future<void> pushReplacement(BuildContext context, Widget page) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => page),
  );
}

extension Push on BuildContext {
  Future<void> push(Widget page) async {
    await Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
