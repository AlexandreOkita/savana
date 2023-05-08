import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/round_type.dart';
import 'package:savana/model/team.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';

class GameViewModel {
  final ProviderRef ref;

  GameViewModel(this.ref);

  RoundType getRoundType() {
    return ref.watch(currentRoundProvider);
  }

  TeamName getCurrentTeamName() {
    return ref.watch(currentTeamProvider).teamName;
  }
}

final gameViewModel = Provider<GameViewModel>((ref) {
  return GameViewModel(ref);
});
