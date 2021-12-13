class Vars {
  Map _mismatchedLetters = {
    'E': 'ε',
    'K': 'κ',
    'P': 'ρ',
    'A': 'α',
    'B': 'β',
    'T': 'τ',
    'Y': 'υ',
    'I': 'ι',
    'O': 'ο',
    'H': 'η',
    'Z': 'ζ',
    'X': 'χ',
    'N': 'ν',
    'M': 'μ',
  };

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

  Map _greekAbbreviationsMap = {
    'E': ' ευρώ',
    'Λ': ' λεπτά',
    'AP': 'Αριθμός',
    'KAPTA': 'κάρτα',
    'EXOYN': 'έχουν',
    'ETAIPEIA': 'εταιρεία',
    // 'MEΛOΣ': 'μέλος', // add a different group for greek words.
  };

  Map getMismatchedLetters() => _mismatchedLetters;
  List getGreekAlphabet() => _greekAlphabet;
  Map getGreekAbbreviationsMap() => _greekAbbreviationsMap;
}
