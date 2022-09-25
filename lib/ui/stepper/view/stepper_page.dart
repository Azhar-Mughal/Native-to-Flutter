import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stepper/ui/stepper/models/stepper_model.dart';
import 'package:flutter_stepper/ui/stepper/view/stepper_view.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  /// Current Index Of Stepper
  int _index = 0;

  ///Method Channel
  static const platform = MethodChannel('samples.flutter.dev/stepper');

  /// Stepper List Initialization
  List<StepperModel> stepperList = [];

  /// Bool Variable for show loading before loading data
  bool showLoading = true;

  /// Loading stepper data from Native Android
  Future<void> stepperFromNativeCode() async {
    try {
      var result = await platform.invokeMethod('getStepperModel');
      var response = jsonDecode(result);

      List list = response;
      for (var i = 0; i < list.length; i++) {
        stepperList.add(StepperModel(
          stepperTitle: list[i]["stepper_title"],
          stepperSubtitle: list[i]["stepper_subtitle"],
          stepperDescription: list[i]["stepper_description"],
        ));
      }
      setState(() {
        showLoading = false;
      });
    } on PlatformException catch (e) {
      print("Exception : ${e.toString()}");
      setState(() {
        showLoading = false;
      });
    }
  }

  /// Init state of widget
  @override
  void initState() {
    stepperFromNativeCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Page"),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: showLoading
          ? const SizedBox.shrink()
          : StepperView(
              mIndex: _index,
              mOnCancelPressed: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              mOnContinuePressed: () {
                if (_index <= 0 || _index <= 1) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              mOnStopPressed: (int index) {
                setState(() {
                  _index = index;
                });
              },
              stepperList: stepperList,
            ),
    );
  }
}
