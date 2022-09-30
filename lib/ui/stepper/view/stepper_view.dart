import 'package:flutter/material.dart';

import '../models/stepper_model.dart';
import '../widgets/custom_stepper_view.dart';

class StepperView extends StatelessWidget {
  final Function()? mOnContinuePressed, mOnBackPressed;
  final Function(int)? mOnStopPressed;
  final List<StepperModel> stepperList;
  final int mIndex;

  const StepperView({
    Key? key,
    required this.mOnContinuePressed,
    required this.mOnBackPressed,
    required this.mOnStopPressed,
    required this.stepperList,
    required this.mIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStepperPage(
      mCurrentStep: mIndex,
      mOnStepBackPressed: mOnBackPressed,
      mOnStepContinuePressed: mOnContinuePressed,
      mOnStepPressed: mOnStopPressed,
      mStepsList: stepperList
          .map(
            (e) => CustomStep(
              mStepTitle: Text(
                e.stepperTitle!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              mStepSubtitle: Text(
                e.stepperSubtitle ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              mStepContent: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  e.stepperDescription!,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
