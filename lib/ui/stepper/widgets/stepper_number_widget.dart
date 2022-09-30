import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperNumberWidget extends StatelessWidget {
  final String mNumberText;

  const StepperNumberWidget({Key? key, required this.mNumberText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 24,
      height: 24,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGrey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            mNumberText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
