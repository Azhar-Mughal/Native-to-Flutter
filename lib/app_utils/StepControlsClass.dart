import 'package:flutter/cupertino.dart';

//@immutable
class CustomControlsDetails {
  const CustomControlsDetails({
    required this.mStepCurrentStep,
    required this.mStepIndex,
    this.mStepCancelOnPressed,
    this.mStepContinueOnPressed,
  });

  final int mStepCurrentStep;

  final int mStepIndex;

  final VoidCallback? mStepContinueOnPressed;

  final VoidCallback? mStepCancelOnPressed;

  bool get isActive => mStepCurrentStep == mStepIndex;
}
