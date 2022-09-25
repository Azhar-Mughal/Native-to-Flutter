class StepperModel {
  String? stepperTitle;
  String? stepperSubtitle;
  String? stepperDescription;

  StepperModel(
      {this.stepperTitle, this.stepperSubtitle, this.stepperDescription});

  StepperModel.fromJson(Map<String, dynamic> json) {
    stepperTitle = json['stepper_title'];
    stepperSubtitle = json['stepper_subtitle'];
    stepperDescription = json['stepper_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stepper_title'] = this.stepperTitle;
    data['stepper_subtitle'] = this.stepperSubtitle;
    data['stepper_description'] = this.stepperDescription;
    return data;
  }
}
