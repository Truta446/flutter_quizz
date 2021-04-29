import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;

  NextButtonWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(label));
  }
}