import 'package:flutter/material.dart';

class TitleAndSubtitleWidget extends StatelessWidget {
  final Widget mTitleWidget, mSubTitleWidget;

  const TitleAndSubtitleWidget(
      {Key? key, required this.mSubTitleWidget, required this.mTitleWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        mTitleWidget,
        Container(
          margin: const EdgeInsets.only(top: 2.0),
          child: mSubTitleWidget,
        ),
      ],
    );
  }
}
