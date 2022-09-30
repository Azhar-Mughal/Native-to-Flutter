import 'package:flutter/material.dart';
import 'package:flutter_stepper/ui/stepper/widgets/stepper_list_widget.dart';

import '../../../app_utils/CustomSepperStateEnum.dart';
import '../../../app_utils/StepControlsClass.dart';

class CustomStepperPage extends StatefulWidget {
  final List<CustomStep> mStepsList;

  final int mCurrentStep;
  final ValueChanged<int>? mOnStepPressed;
  final VoidCallback? mOnStepContinuePressed;
  final VoidCallback? mOnStepBackPressed;

  const CustomStepperPage({
    Key? key,
    required this.mStepsList,
    this.mCurrentStep = 0,
    this.mOnStepPressed,
    this.mOnStepContinuePressed,
    this.mOnStepBackPressed,
  }) : super(key: key);

  @override
  State<CustomStepperPage> createState() => _CustomStepperPageState();
}

class _CustomStepperPageState extends State<CustomStepperPage>
    with TickerProviderStateMixin {
  late List<GlobalKey> _stepsGlobalKeys;

  @override
  void initState() {
    super.initState();
    _stepsGlobalKeys = List<GlobalKey>.generate(
      widget.mStepsList.length,
      (int i) => GlobalKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StepperListWidget(
      mStepsList: widget.mStepsList,
      mOnStepContinuePressed: widget.mOnStepContinuePressed,
      mOnStepBackPressed: widget.mOnStepBackPressed,
      mGlobalKeysList: _stepsGlobalKeys,
      mCurrentStep: widget.mCurrentStep,
      mOnStepPressed: widget.mOnStepPressed,
    );
  }
}

typedef ControlsWidgetBuilder = Widget Function(
    BuildContext context, CustomControlsDetails details);

@immutable
class CustomStep {
  final Widget mStepTitle;
  final Widget? mStepSubtitle;
  final Widget mStepContent;
  final CustomStepState mStepState;
  final bool mStepIsActive;

  const CustomStep({
    required this.mStepTitle,
    required this.mStepContent,
    this.mStepSubtitle,
    this.mStepState = CustomStepState.indexed,
    this.mStepIsActive = false,
  });
}
