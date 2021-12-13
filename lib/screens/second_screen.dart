import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/layouts/translated_layout.dart';
import 'package:greekfix/layouts/output_layout.dart';
import 'package:greekfix/utils/buttons.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    required Key key,
    required this.orientation,
    required this.boxSide,
  }) : super(key: key);

  final Orientation orientation;
  final double boxSide;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (orientation.index == Orientation.landscape.index)
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: layoutSecondScreenLandscape(boxSide, orientation),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutSecondScreenPortrait(boxSide, orientation),
          );
        }
      },
    );
  }
}

List<Widget> layoutSecondScreenPortrait(boxSide, orientation) {
  return [
    SizedBox(height: 40),
    Expanded(
      flex: 6,
      child: OutputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCopy(),
            SizedBox(
              width: 20,
            ),
            ButtonTranslate(),
          ],
        ),
      ),
    ),
    Expanded(flex: 6, child: TranslatedLayout(boxSide, orientation)),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonRefresh(),
          ],
        ),
      ),
    ),
    SizedBox(height: 20),
  ];
}

List<Widget> layoutSecondScreenLandscape(boxSide, orientation) {
  return [
    //SizedBox(width: 10),
    SizedBox(width: 17),
    Expanded(
      flex: 6,
      child: OutputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonCopy(),
          SizedBox(
            height: 40,
          ),
          ButtonTranslate(),
        ],
      ),
    ),
    Expanded(
      flex: 6,
      child: TranslatedLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonRefresh(),
        ],
      ),
    ),
    SizedBox(width: 10),
  ];
}
