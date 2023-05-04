import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/viewmodel/providers/configuration_providers.dart';

class GameConfigViewModel {
  final ProviderRef ref;

  GameConfigViewModel(this.ref);

  void increasePlayerQtt() {
    ref.read(playerQuantityProvider.notifier).state++;
  }

  void decreasePlayerQtt() {
    if (ref.read(playerQuantityProvider.notifier).state > 4) {
      ref.read(playerQuantityProvider.notifier).state--;
    }
  }

  int getPlayerQtt() {
    return ref.watch(playerQuantityProvider);
  }

  void increaseWordsPerPlayer() {
    ref.read(wordsPerPlayerProvider.notifier).state++;
  }

  void decreaseWordsPerPlayer() {
    if (ref.read(wordsPerPlayerProvider.notifier).state > 1) {
      ref.read(wordsPerPlayerProvider.notifier).state--;
    }
  }

  int getWordsPerPlayer() {
    return ref.watch(wordsPerPlayerProvider);
  }

  void increaseMinutesPerRound() {
    ref.read(minutesPerRoundProvider.notifier).state++;
  }

  void decreaseMinutesPerRound() {
    if (ref.read(minutesPerRoundProvider.notifier).state > 0) {
      ref.read(minutesPerRoundProvider.notifier).state--;
    }
  }

  int getMinutesPerRound() {
    return ref.watch(minutesPerRoundProvider);
  }
}

final gameConfigViewModel = Provider<GameConfigViewModel>((ref) {
  return GameConfigViewModel(ref);
});
