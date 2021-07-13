import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greekfix/utils/constants.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:provider/provider.dart';

class TextFieldInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: kTextStyleFields,
      controller: Provider.of<Data>(context, listen: false).controllerText1,
      // onChanged: (pastedText) {
      //   Provider.of<Data>(context, listen: false).passingPastedText(pastedText);
      // },
      minLines: 17,
      maxLines: 17,
      decoration: InputDecoration(
        filled: false,
        fillColor: const Color(0XFFD4D7D9),
        //hintText: 'Press the paste button',
        hintStyle: kHintStyleFields,
        border: kTextFieldBorder,
      ),
    );
  }
}
