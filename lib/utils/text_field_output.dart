import 'package:flutter/material.dart';
import 'package:greekfix/utils/constants.dart';

class TextFieldOutput extends StatelessWidget {
  final TextEditingController controllerTwo;
  TextFieldOutput(this.controllerTwo);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: kTextStyleFields,
      controller: controllerTwo,
      // onChanged: (pastedText) {
      //   Provider.of<Data>(context, listen: false).passingPastedText(pastedText);
      // },
      minLines: 17,
      maxLines: 17,
      decoration: InputDecoration(
        filled: false,
        fillColor: const Color(0XFFD4D7D9),
        border: kTextFieldBorder,
      ),
    );
  }
}

//
// async {
// await FlutterClipboard.copy(controller2.text);
// },
