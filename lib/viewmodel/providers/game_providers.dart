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

final currentTeamProvider = StateProvider<Team>((ref) {
  return Team(totalScore: 0, currentRoundScore: 0, teamName: TeamName.giraffe);
});

final currentWordProvider = StateProvider<String>((ref) {
  return "";
});
