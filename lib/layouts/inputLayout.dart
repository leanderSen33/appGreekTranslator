import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/utils/texfFieldInput.dart';
import 'package:greekfix/utils/boxSideConfig.dart';

class InputLayout extends StatelessWidget {
  final double boxSide;

  final Orientation orientation;
  InputLayout(this.boxSide, this.orientation);

  final BoxSideConfig boxSideConfig = BoxSideConfig();

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      //parentColor: Colors.lightGreen,
      color: Color(0XFF2F3A3E), //0XFF2F3A3E 0XFFD4D7D9
      width: boxSideConfig.boxSideWidthLogic(orientation, boxSide),
      height: boxSideConfig.boxSideHeightLogic(orientation, boxSide),
      borderRadius: 30,
      depth: 40,
      spread: 5,
      emboss: false,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFieldInput(),
      ),
    );
  }
}

// ButtonVisualizeColors()
