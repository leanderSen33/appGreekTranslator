import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/logic/change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/utils/box_side_config.dart';

class ColorLayout extends StatelessWidget {
  final double boxSide;
  final Orientation orientation;
  ColorLayout(this.boxSide, this.orientation);
  final BoxSideConfig boxSideConfig = BoxSideConfig();
//0XFFf96778
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      width: double.infinity,
      height: boxSideConfig.boxSideHeightLogic(orientation, boxSide),
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
