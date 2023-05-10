import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/round_type.dart';
import 'package:savana/model/team.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';

class GameViewModel {
  final ProviderRef _ref;

  GameViewModel(this._ref);

  RoundType getRoundType() {
    return _ref.watch(currentRoundProvider);
  }

  TeamName getCurrentTeamName() {
    return _ref.watch(currentTeamProvider).teamName;
  }

  String getNewWord() {
    final allWords = _ref.read(wordsPoolProvider);
    final correctWords = _ref.read(correctRoundWords);

    final remainingWords = allWords.where((element) => !correctWords.contains(element)).toList();
    final newWord = remainingWords[Random().nextInt(remainingWords.length)];
    _ref.read(currentWordProvider.notifier).state = newWord;
    return newWord;
  }

  void addCorrectWord() {
    _ref.read(correctRoundWords.notifier).state = [
      ..._ref.read(correctRoundWords),
      _ref.read(currentWordProvider)
    ];
    getNewWord();
  }

  String getCurrentWord() {
    return _ref.watch(currentWordProvider);
  }

  bool roundWillEnd() {
    return _ref.read(wordsPoolProvider).length == _ref.read(correctRoundWords).length + 1;
  }
}

final gameViewModel = Provider<GameViewModel>((ref) {
  return GameViewModel(ref);
});
