import 'package:flutter/material.dart';

class BrainWordCorrector {
  List _greekAlphabet = [
    'Ε',
    'Ρ',
    'Τ',
    'Υ',
    'Θ',
    'Ι',
    'Ο',
    'Π',
    'Α',
    'Σ',
    'Δ',
    'Φ',
    'Γ',
    'Η',
    'Ξ',
    'Κ',
    'Λ',
    'Ζ',
    'Χ',
    'Ψ',
    'Ω',
    'Ω',
    'Β',
    'Ν',
    'Μ'
  ];

  bool _isGreekWord(String word) {
    List<String> wordSplit = word.split('');

    for (var letters in wordSplit) {
      bool isGreek = _greekAlphabet.contains(letters);

      if (isGreek == true) {
        return true;
      }
    }
    return false;
  }

  RegExp isLatin = RegExp(r"[A-Za-z]+");
  List<TextSpan> finalColorList = [];

  List<TextSpan> getFinalList() => finalColorList;

  void addNonGreekWord(String word) {
    word = word + ' ';
    addNormalLetter(word);
  }

  void addGreekWord(String word) {
    word = word + ' ';
    List textList = word.split('');
    for (var letter in textList) {
      if (isLatin.hasMatch(letter)) {
        addColoredLetter(letter);
      } else {
        addNormalLetter(letter);
      }
    }
  }

  List<TextSpan> addColoredLetter(String letter) {
    finalColorList.add(
      TextSpan(
          text: letter.toLowerCase(),
          style: TextStyle(color: Colors.pinkAccent)),
    );
    return finalColorList;
  }

  List<TextSpan> addNormalLetter(String letter) {
    finalColorList.add(
      TextSpan(text: letter),
    );
    return finalColorList;
  }

  List<String> listOfSeparators = [
    '[',
    '(',
    ')',
    ';',
    '.',
    ',',
    '!',
    '"',
    '-',
    '/',
    ']',
  ];

  String sms = 'WESTERN UNION! ΓIA AΠOΣTOΛH-ΠAPAΛABH/DGF XPHMATΩN,';

  void testingColoring(String message) {
    List wordGroupList = message.split(' ');
    for (var wordGroup in wordGroupList) {
      checkSeparator(0, wordGroup);
    }
  }

  RegExp _separatorIII = RegExp(r"[();.,!'-]");

  void checkSeparator(int separatorIndex, String wordGroup) {
    if (wordGroup.contains(_separatorIII)) {
      for (var wordSubGroup
          in wordGroup.split(listOfSeparators[separatorIndex])) {
        checkSeparator(separatorIndex + 1, wordSubGroup);
        pintWord(wordSubGroup); // ?
      }
    } else {
      pintWord(wordGroup);
    }
  }

  void pintWord(word) {
    if (_isGreekWord(word)) {
      addGreekWord(word);
    } else
      addNormalLetter(word);
  }
}
