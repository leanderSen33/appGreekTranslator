import 'package:flutter/material.dart';
import 'package:greekfix/data/latin_words_list.dart';
import 'package:greekfix/data/brain_vars.dart';

class BrainWordCorrector {
  LatinList latinList = LatinList();
  Vars vars = Vars();
  bool isLowerCase = false;
  RegExp _separator = RegExp(r"[();:., !'-]");
  RegExp _separatorWithSlash = RegExp(r"[();:., !'-/]");
  RegExp _isLatin = RegExp(r"[A-Za-z]+");
  String e = 'E';
  String l = 'Λ';
  String ap = 'AP';
  String karta = 'KAPTA';
  String exoyn = 'EXOYN';
  String etaipeia = 'ETAIPEIA';

  String wordCorrector(String message) {
    _finalColorList = [];
    Map _mismatchedLetters = vars.getMismatchedLetters();
    Map _greekAbbreviationsMap = vars.getGreekAbbreviationsMap();

    List wordsList = message.split(_separator);
    for (var word in wordsList) {
      if (wordsList.contains('A/A')) {
        String finalWord = word;
        finalWord = finalWord.replaceAll('A/A', 'Αυξων Αριθμός');
        message = message.replaceFirst(word, finalWord);
      }
    }
    List wordsList2 = message.split(_separatorWithSlash);
    for (var word in wordsList2) {
      if (_isGreek(word)) {
        var minutesAbbreviation = RegExp(r'^[0-9]+Λ$').hasMatch(word);
        if (minutesAbbreviation) {
          String numOfMinutesWord = word;
          for (var element in _greekAbbreviationsMap.keys) {
            numOfMinutesWord = numOfMinutesWord.replaceFirst(
                element, _greekAbbreviationsMap[element]);
          }
          message = message.replaceFirst(word, numOfMinutesWord);
        }
        _addGreekWord(word); // Add to the Word Painter to paint latin chars
        String finalWord = word;
        for (var letter in _mismatchedLetters.keys) {
          finalWord = finalWord.replaceAll(letter, _mismatchedLetters[letter]);
        }
        message = message.replaceFirst(word, finalWord);
      } else {
        List<String> exceptionListSplitII = latinList.getList();
        if (exceptionListSplitII.contains(word) ||
            word == e ||
            word == l ||
            word == ap ||
            word == karta ||
            word == exoyn ||
            word == etaipeia) {
          String toPaint = word;
          _addGreekWord(toPaint);
        } else {
          _addNonGreekWord(word);
        }

        var euroAbbreviation = RegExp(r'^[0-9]+E$').hasMatch(word);
        if (euroAbbreviation) {
          String endWord = word;
          for (var element in _greekAbbreviationsMap.keys) {
            endWord =
                endWord.replaceFirst(element, _greekAbbreviationsMap[element]);
          }
          message = message.replaceFirst(word, endWord);
        }
        if (_greekAbbreviationsMap.containsKey(word) && word != 'E') {
          message = message.replaceFirst(word, _greekAbbreviationsMap[word]);
        }
        List<String> exceptionListSplit = latinList.getList();
        if (exceptionListSplit.contains(word) && word != 'A/A') {
          String finalWord = word;
          for (var letter in _mismatchedLetters.keys) {
            finalWord =
                finalWord.replaceAll(letter, _mismatchedLetters[letter]);
          }
          message = message.replaceFirst(word, finalWord);
        }
      }
    }
    return message.toLowerCase();
  }

  bool _isGreek(String word) {
    List _greekAlphabet = vars.getGreekAlphabet();
    List<String> wordSplit = word.split('');
    for (var letters in wordSplit) {
      bool isGreek = _greekAlphabet.contains(letters);
      if (isGreek == true) {
        return true;
      }
    }
    return false;
  }

  List<TextSpan> _finalColorList = [];
  List<TextSpan> get finalList => _finalColorList;

  void _addNonGreekWord(String word) async {
    word = word + ' ';
    _addNormalLetter(word);
  }

  void _addGreekWord(String word) {
    word = word + ' ';
    List textList = word.split('');
    for (var letter in textList) {
      if (_isLatin.hasMatch(letter)) {
        addColoredLetter(letter);
      } else {
        _addNormalLetter(letter);
      }
    }
  }

  List<TextSpan> addColoredLetter(String letter) {
    _finalColorList.add(
      TextSpan(
          text: isLowerCase ? letter.toLowerCase() : letter, // toLowerCase() ?
          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 17)),
    );
    return _finalColorList;
  }

  List<TextSpan> _addNormalLetter(String letter) {
    _finalColorList.add(
      TextSpan(
          text: letter, style: TextStyle(color: Colors.white, fontSize: 17)),
    );
    return _finalColorList;
  }
}
