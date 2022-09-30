import 'package:flutter/material.dart';

class StepperButtonsWidget extends StatelessWidget {
  final int mIndex;
  final VoidCallback? mOnStepContinuePressed;
  final VoidCallback? mOnStepBackPressed;

  const StepperButtonsWidget({
    Key? key,
    required this.mIndex,
    required this.mOnStepBackPressed,
    required this.mOnStepContinuePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48.0),
        child: Row(
          children: <Widget>[
            TextButton(
              onPressed: mOnStepContinuePressed,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.cyan),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 16.0)),
              ),
              child: Text(mIndex == 2 ? "Finish" : "Continue"),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: TextButton(
                onPressed: mOnStepBackPressed,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.grey),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 16.0)),
                ),
                child: const Text("Back"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
