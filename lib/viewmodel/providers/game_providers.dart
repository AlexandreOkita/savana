import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/round_type.dart';
import 'package:savana/model/team.dart';

final playerWordsProvider = StateProvider<List<String>>((ref) {
  return [];
});

final wordsPoolProvider = StateProvider<List<String>>((ref) {
  return [];
});

final playersDoneQuantityProvider = StateProvider<int>((ref) => 0);

final currentRoundProvider = StateProvider<RoundType>((ref) {
  return RoundType.definition;
});

final correctRoundWords = StateProvider<List<String>>((ref) {
  return [];
});

final startingTeamProvider = StateProvider<int>(
  (ref) => Random().nextInt(2),
);

final teamsProvider = Provider<List<Team>>(
  (ref) => [
    Team(totalScore: 0, currentRoundScore: 0, teamName: TeamName.zebra),
    Team(totalScore: 0, currentRoundScore: 0, teamName: TeamName.giraffe),
  ],
);

final currentTeamProvider = StateProvider<int>((ref) {
  return 0;
});

final currentWordProvider = StateProvider<String>((ref) {
  return "";
});
