import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/utils/textFieldOutput.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:greekfix/utils/boxSideConfig.dart';

class OutputLayout extends StatelessWidget {
  final double boxSide;

  final Orientation orientation;
  OutputLayout(this.boxSide, this.orientation);

  final BoxSideConfig boxSideConfig = BoxSideConfig();

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: Color(0XFF2F3A3E),
      width: boxSideConfig.boxSideWidthLogic(orientation, boxSide),
      height: boxSideConfig.boxSideHeightLogic(orientation, boxSide),
      borderRadius: 30,
      depth: 40,
      spread: 5,
      emboss: false,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFieldOutput(
            Provider.of<Data>(context, listen: false).controllerText2),
      ),
    );
  }
}
