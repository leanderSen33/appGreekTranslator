import 'package:flutter/material.dart';
import 'package:greekfix/logic/brainCorrector.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:translator/translator.dart';

class Data with ChangeNotifier {
  GoogleTranslator googleTranslateAPI = GoogleTranslator();
  String smsCorrected = '';
  String input = '';
  String showTranslatedText = '';
  List<TextSpan> showColoredText = [];
  List<TextSpan> get showColorText => showColoredText;
  bool switchText = false;
  bool pageSnappingChange = true;

  bool getStartedButtonIsPushed = false;

  bool pasteButtonIsPushed = false;
  String pasteIconStatus = 'pasteIcon';

  bool visualizeButtonIsPushed = false;
  String visualizeIconStatus = 'eyeOff';

  bool deleteButtonIsPushed = false;
  String deleteIconStatus = 'deleteOff';

  bool switchCaseButtonIsPushed = false;
  String switchCaseIconStatus = 'caseOff';

  bool fixButtonIsPushed = false;
  String fixIconStatus = 'fixOff';

  bool copyButtonIsPushed = false;
  String copyIconStatus = 'copyOff';

  bool translateButtonIsPushed = false;
  String translateIconStatus = 'translateOff';

  bool returnButtonIsPushed = false;
  String returnIconStatus = 'returnOff';

  var brainCorrector = BrainWordCorrector();
  final PageController controllerPage = PageController(initialPage: 0);

  // pasted text
  TextEditingController controllerText1 = TextEditingController();

  // text corrected and displayed in the lower textField.
  TextEditingController controllerText2 = TextEditingController();

  void clipboardPasteText() async {
    final value = await FlutterClipboard.paste();
    controllerText1.text = value;
    pasteButtonIsPushed = !pasteButtonIsPushed;
    pasteButtonIsPushed
        ? pasteIconStatus = 'pasteOff'
        : pasteIconStatus = 'pasteIcon';

    notifyListeners();
  }

  void deleteButtonDynamic(
      String imageNameOn, String imageNameOff, bool buttonStatus) {
    deleteButtonIsPushed = !deleteButtonIsPushed;
    deleteButtonIsPushed
        ? deleteIconStatus = imageNameOn
        : deleteIconStatus = imageNameOff;
  }

  void clipboardDeleteText() {
    controllerText1.clear();

    deleteButtonDynamic('deleteIcon', 'deleteOff', deleteButtonIsPushed);
    pasteButtonIsPushed = false;
    pasteIconStatus = 'pasteOff';

    if (visualizeButtonIsPushed == true) {
      visualizeButtonIsPushed = false;
      visualizeIconStatus = 'eyeOff';
    }

    if (showColoredText.isNotEmpty) {
      showColoredText = [];
      showColoredText.clear();
    }

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      deleteButtonIsPushed = false;
      deleteIconStatus = 'deleteOff';
      notifyListeners(); // if we don't notify listeners here, after the 1 second, nothing will happen until another button is pressed.
    });

    notifyListeners();
  }

  void visualizeButton() {
    visualizeButtonIsPushed = !visualizeButtonIsPushed;
    visualizeButtonIsPushed
        ? visualizeIconStatus = 'eyeIcon'
        : visualizeIconStatus = 'eyeOff';
    smsCorrected = brainCorrector.wordCorrector(controllerText1.text);
    showColoredText = brainCorrector.finalList;
    notifyListeners();
  }

  void switchCaseButton() {
    switchCaseButtonIsPushed = !switchCaseButtonIsPushed;
    switchCaseButtonIsPushed
        ? switchCaseIconStatus = 'caseIcon'
        : switchCaseIconStatus = 'caseOff';
    switchText = !switchText;
    switchText ? changeLetterCase(switchText) : changeLetterCase(switchText);
    notifyListeners();
  }

  void changeLetterCase(bool status) {
    brainCorrector.isLowerCase = switchText;
    brainCorrector.wordCorrector(controllerText1.text);
    showColoredText = brainCorrector.finalList;
  }

  void fixButton() async {
    fixButtonIsPushed = !fixButtonIsPushed;
    fixButtonIsPushed ? fixIconStatus = 'fixIcon' : fixIconStatus = 'fixOff';
    controllerText2.text = smsCorrected;
    print('FIXED MESSAGE: ${controllerText2.text}');
    input = smsCorrected;
    // controllerPage.jumpToPage(2);
    controllerPage.animateToPage(1,
        duration: Duration(seconds: 2), curve: Curves.ease);
    pageSnappingChange = false;
    notifyListeners();
  }

  void clipboardCopyText() async {
    copyButtonIsPushed = !copyButtonIsPushed;
    copyButtonIsPushed
        ? copyIconStatus = 'copyIcon'
        : copyIconStatus = 'copyOff';

    await FlutterClipboard.copy(controllerText2.text);

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      copyButtonIsPushed = false;
      copyIconStatus = 'copyOff';
      notifyListeners();
    });

    notifyListeners();
    // Scaffold.of(contextOutputField)
    //     .showSnackBar(SnackBar(content: Text('√ Copied to Clipboard')));
  }

  void translateButtonDynamic() {
    translateButtonIsPushed = !translateButtonIsPushed;
    translateButtonIsPushed
        ? translateIconStatus = 'translateIcon'
        : translateIconStatus = 'translateOff';
    notifyListeners();
  }

  void translateButton() async {
    translateButtonDynamic();

    var translatedText;
    await googleTranslateAPI
        .translate(input, from: 'el', to: 'en')
        .then((value) => translatedText = value);
    print('Translation: $translatedText');

    showTranslatedText = translatedText.text;
    controllerPage.animateToPage(1,
        duration: Duration(seconds: 1), curve: Curves.linear);
    notifyListeners();
  }

  void refreshButton() {
    returnButtonIsPushed = !returnButtonIsPushed;
    returnButtonIsPushed
        ? returnIconStatus = 'returnIcon'
        : returnIconStatus = 'returnOff';

    pasteButtonIsPushed = false;
    pasteIconStatus = 'pasteIcon';
    visualizeButtonIsPushed = false;
    visualizeIconStatus = 'eyeOff';
    deleteButtonIsPushed = false;
    deleteIconStatus = 'deleteOff';
    switchCaseButtonIsPushed = false;
    switchCaseIconStatus = 'caseOff';
    fixButtonIsPushed = false;
    fixIconStatus = 'fixOff';
    copyButtonIsPushed = false;
    copyIconStatus = 'copyOff';
    translateButtonIsPushed = false;
    translateIconStatus = 'translateOff';

    smsCorrected = '';
    controllerText1.text = '';
    controllerText2.text = '';
    controllerText1.clear();
    controllerText2.clear();
    showTranslatedText = '';
    showColoredText = [];
    showColoredText.clear();
    pageSnappingChange = true;
    controllerPage.animateToPage(0,
        duration: Duration(seconds: 1), curve: Curves.linear);

    Duration oneSecond = Duration(seconds: 1);
    Future.delayed(oneSecond, () {
      returnButtonIsPushed = false;
      returnIconStatus = 'returnOff';
      notifyListeners();
    });

    notifyListeners();
  }

  void pressGetStarted() {
    getStartedButtonIsPushed = true;
    notifyListeners();

    Duration oneSecond = Duration(seconds: 2);
    Future.delayed(oneSecond, () {
      getStartedButtonIsPushed = false;
      notifyListeners();
    });
  }

// Use this in case we want to show the changes in the input textField.
// void passingPastedText(String newString) {
//   sms = newString;
//   notifyListeners();
// }

}
