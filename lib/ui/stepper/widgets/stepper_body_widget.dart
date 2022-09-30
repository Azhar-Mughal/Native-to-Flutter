import 'package:flutter/material.dart';

import 'stepper_buttons_widget.dart';

class StepperBodyWidget extends StatelessWidget {
  final bool mIsLastStep;
  final int mStepIndex, mCurrentStep;
  final Widget mContentWidget;
  final VoidCallback? mOnStepContinuePressed;
  final VoidCallback? mOnStepBackPressed;

  const StepperBodyWidget({
    Key? key,
    required this.mOnStepContinuePressed,
    required this.mIsLastStep,
    required this.mContentWidget,
    required this.mCurrentStep,
    required this.mOnStepBackPressed,
    required this.mStepIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: mIsLastStep ? 0.0 : 1.0,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 60.0,
              end: 24.0,
              bottom: 24.0,
            ),
            child: Column(
              children: <Widget>[
                mContentWidget,
                StepperButtonsWidget(
                  mIndex: mStepIndex,
                  mOnStepBackPressed: mOnStepBackPressed,
                  mOnStepContinuePressed: mOnStepContinuePressed,
                ),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: mCurrentStep == mStepIndex
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }
}
