import 'package:flutter/material.dart';

class StepperLineWidget extends StatelessWidget {
  final bool mShowLine;

  const StepperLineWidget({Key? key, required this.mShowLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mShowLine ? 1.0 : 0.0,
      height: 16.0,
      color: Colors.grey.shade400,
    );
  }
}
