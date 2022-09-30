import 'package:flutter/material.dart';
import 'package:flutter_stepper/ui/stepper/widgets/custom_stepper_view.dart';
import 'package:flutter_stepper/ui/stepper/widgets/stepper_body_widget.dart';
import 'package:flutter_stepper/ui/stepper/widgets/stepper_header_widget.dart';

class StepperListWidget extends StatefulWidget {
  final List<CustomStep> mStepsList;
  final VoidCallback? mOnStepContinuePressed;
  final VoidCallback? mOnStepBackPressed;
  final ValueChanged<int>? mOnStepPressed;
  final List<GlobalKey> mGlobalKeysList;
  final int mCurrentStep;

  const StepperListWidget({
    Key? key,
    required this.mStepsList,
    required this.mOnStepContinuePressed,
    required this.mOnStepBackPressed,
    required this.mGlobalKeysList,
    required this.mCurrentStep,
    required this.mOnStepPressed,
  }) : super(key: key);

  @override
  State<StepperListWidget> createState() => _StepperListWidgetState();
}

class _StepperListWidgetState extends State<StepperListWidget> {
  bool _isFirstStep(int index) {
    return index == 0;
  }

  bool _isLastStep(int index) {
    return widget.mStepsList.length - 1 == index;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        for (int i = 0; i < widget.mStepsList.length; i += 1)
          Column(
            key: widget.mGlobalKeysList[i],
            children: <Widget>[
              InkWell(
                onTap: widget.mStepsList[i].mStepState != StepState.disabled
                    ? () {
                        Scrollable.ensureVisible(
                          widget.mGlobalKeysList[i].currentContext!,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );

                        widget.mOnStepPressed?.call(i);
                      }
                    : null,
                canRequestFocus:
                    widget.mStepsList[i].mStepState != StepState.disabled,
                child: StepperHeaderWidget(
                  index: i,
                  mTitleWidget: widget.mStepsList[i].mStepTitle,
                  mSubTitleWidget: widget.mStepsList[i].mStepSubtitle!,
                  mIsFirstStep: !_isFirstStep(i),
                  mIsLastStep: !_isLastStep(i),
                ),
              ),
              StepperBodyWidget(
                mIsLastStep: _isLastStep(i),
                mContentWidget: widget.mStepsList[i].mStepContent,
                mCurrentStep: widget.mCurrentStep,
                mOnStepBackPressed: widget.mOnStepBackPressed,
                mOnStepContinuePressed: widget.mOnStepContinuePressed,
                mStepIndex: i,
              )
            ],
          ),
      ],
    );
  }
}
