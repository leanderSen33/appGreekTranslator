import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/utils/boxSideConfig.dart';

class ColorLayout extends StatelessWidget {
  final double boxSide;
  final Orientation orientation;
  ColorLayout(this.boxSide, this.orientation);
  final BoxSideConfig boxSideConfig = BoxSideConfig();
//0XFFf96778
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
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: RichText(
            text: TextSpan(
              children: Provider.of<Data>(context, listen: true).showColorText,
            ),
          ),
        ),
      ),
    );
  }
}
