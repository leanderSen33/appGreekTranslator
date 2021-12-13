import 'dart:ui';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/utils/text_field_input.dart';
import 'package:greekfix/utils/box_side_config.dart';

class InputLayout extends StatelessWidget {
  final double boxSide;

  final Orientation orientation;
  InputLayout(this.boxSide, this.orientation);

  final BoxSideConfig boxSideConfig = BoxSideConfig();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        // borderRadius: BorderRadius.circular(25),
      ),
      width: double.infinity,
      height: boxSideConfig.boxSideHeightLogic(orientation, boxSide),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFieldInput(),
      ),
    );
  }
}

// ButtonVisualizeColors()
