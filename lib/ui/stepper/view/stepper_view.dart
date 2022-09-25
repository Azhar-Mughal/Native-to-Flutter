import 'package:flutter/material.dart';

import '../models/stepper_model.dart';

class StepperView extends StatelessWidget {
  final Function()? mOnContinuePressed, mOnCancelPressed;
  final Function(int)? mOnStopPressed;
  final List<StepperModel> stepperList;
  final int mIndex;
  const StepperView({
    Key? key,
    required this.mOnContinuePressed,
    required this.mOnCancelPressed,
    required this.mOnStopPressed,
    required this.stepperList,
    required this.mIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: mIndex,
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: details.onStepContinue,
              child: Text(mIndex == 2 ? "FINISH" : 'CONTINUE'),
            ),
            TextButton(
              onPressed: details.onStepCancel,
              child: const Text(
                'BACK',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
      onStepCancel: mOnCancelPressed,
      onStepContinue: mOnContinuePressed,
      onStepTapped: mOnStopPressed,
      steps: stepperList
          .map(
            (e) => Step(
              title: Text(e.stepperTitle!),
              subtitle: Text(e.stepperSubtitle ?? ""),
              content: Container(
                alignment: Alignment.centerLeft,
                child: Text(e.stepperDescription!),
              ),
            ),
          )
          .toList(),
    );
  }
}
