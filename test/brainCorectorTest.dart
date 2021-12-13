import 'package:flutter/cupertino.dart';
import 'package:greekfix/logic/brain_corrector.dart';
import 'package:greekfix/data/test_set.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TestSet testSet = TestSet();
  Map testMap = testSet.getSMS();
  testMap.forEach((key, value) => testSMS(key, value));
}

void testSMS(String key, String value) {
  BrainWordCorrector brainCorrector = BrainWordCorrector();
  test(key, () {
    String correctedText = brainCorrector.wordCorrector(key);
    expect(correctedText, value);
  });
}
