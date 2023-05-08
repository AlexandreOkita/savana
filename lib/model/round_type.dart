enum RoundType { definition, word, mimic, sound }

extension RoundTypeStrings on RoundType {
  String getName() {
    switch (this) {
      case RoundType.definition:
        return "JOGO 1 - DEFINIÇÃO";
      case RoundType.word:
        return "JOGO 2 - PALAVRA";
      case RoundType.mimic:
        return "JOGO 3 - MÍMICA";
      case RoundType.sound:
        return "JOGO 4 - ONOMATOPEIA";
    }
  }

  String getDefinition() {
    switch (this) {
      case RoundType.definition:
        return "Explique cada palavra o mais rápido possível para fazer mais pontos";
      case RoundType.word:
        return "Utilize apenas uma palavra para definir sua palavra";
      case RoundType.mimic:
        return "Utilize mimica para definir sua palavra";
      case RoundType.sound:
        return "Utilize apenas onomatopeias para definir sua palavra";
    }
  }
}
