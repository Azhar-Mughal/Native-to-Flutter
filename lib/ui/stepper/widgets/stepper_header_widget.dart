import 'package:flutter/material.dart';
import 'package:flutter_stepper/ui/stepper/widgets/stepper_line_widget.dart';
import 'package:flutter_stepper/ui/stepper/widgets/stepper_number_widget.dart';
import 'package:flutter_stepper/ui/stepper/widgets/title_and_subtitle_widget.dart';

class StepperHeaderWidget extends StatelessWidget {
  final int index;
  final Widget mTitleWidget, mSubTitleWidget;
  final bool mIsFirstStep, mIsLastStep;

  const StepperHeaderWidget({
    Key? key,
    required this.index,
    required this.mSubTitleWidget,
    required this.mTitleWidget,
    required this.mIsFirstStep,
    required this.mIsLastStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              StepperLineWidget(mShowLine: mIsFirstStep),
              StepperNumberWidget(mNumberText: '${index + 1}'),
              StepperLineWidget(mShowLine: mIsLastStep),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: TitleAndSubtitleWidget(
                mTitleWidget: mTitleWidget,
                mSubTitleWidget: mSubTitleWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
