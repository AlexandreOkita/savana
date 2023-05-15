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

  void updateRoundType() {
    _ref.read(currentRoundProvider.notifier).state = _ref.read(currentRoundProvider).getNext();
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
  }

  void resetRound() {
    _ref.read(correctRoundWords.notifier).state = [];
  }

  String getCurrentWord() {
    return _ref.watch(currentWordProvider);
  }

  bool roundEnded() {
    return _ref.read(wordsPoolProvider).length == _ref.read(correctRoundWords).length;
  }

  TeamName getCurrentTeamName() {
    final index = _ref.watch(currentTeamProvider);
    return _ref.watch(teamsProvider)[index].teamName;
  }

  int getTeamScore(TeamName name) {
    return _ref.watch(teamsProvider).where((team) => team.teamName == name).first.totalScore;
  }

  void updateStartingTeam() {
    final currentStartingTeam = _ref.read(startingTeamProvider);
    int startingTeam = -1;
    final teams = _ref.watch(teamsProvider);
    if (teams.length == currentStartingTeam + 1) {
      startingTeam = 0;
    } else {
      startingTeam = currentStartingTeam + 1;
    }
    _ref.read(startingTeamProvider.notifier).state = startingTeam;
    _ref.read(currentTeamProvider.notifier).state = startingTeam;
  }

  void updateCurrentTeam() {
    final currentTeam = _ref.read(currentTeamProvider);
    final teams = _ref.watch(teamsProvider);
    if (teams.length == currentTeam + 1) {
      _ref.read(currentTeamProvider.notifier).state = 0;
    } else {
      _ref.read(currentTeamProvider.notifier).state += 1;
    }
  }

  // This operation does not generate an event!
  void addPointToCurrentTeam() {
    final index = _ref.watch(currentTeamProvider);
    _ref.watch(teamsProvider)[index].totalScore += 1;
  }
}

final gameViewModel = Provider<GameViewModel>((ref) {
  return GameViewModel(ref);
});
