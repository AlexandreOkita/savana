import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/time.dart';
import 'package:savana/viewmodel/providers/configuration_providers.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';

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
    ref.read(timePerRoundProvider.notifier).state =
        ref.read(timePerRoundProvider.notifier).state.changeTimeInSeconds(10);
  }

  void decreaseMinutesPerRound() {
    if (ref.read(timePerRoundProvider.notifier).state.getTotalInSeconds() > 60) {
      ref.read(timePerRoundProvider.notifier).state =
          ref.read(timePerRoundProvider.notifier).state.changeTimeInSeconds(-10);
    }
  }

  String getTimePerRoundFormated() {
    final Time time = ref.watch(timePerRoundProvider);
    if (time.seconds == 0) {
      return "${time.minutes} min";
    } else if (time.minutes == 0) {
      return "${time.seconds} seg";
    }
    return "${time.minutes} min ${time.seconds} seg";
  }

  int getTimeEstimative() {
    final int poolSize = ref.watch(wordsPerPlayerProvider) * ref.watch(playerQuantityProvider);
    double time = 0;
    time += poolSize / 6;
    time += poolSize / 6;
    time += poolSize / 3;
    time += poolSize / 2;

    time += (time / ref.watch(timePerRoundProvider).getTotalInMinutes()) / 2;
    return time.ceil();
  }

  bool allPlayerAreDone() {
    return ref.watch(playersDoneQuantityProvider) == ref.watch(playerQuantityProvider);
  }
}

final gameConfigViewModel = Provider<GameConfigViewModel>((ref) {
  return GameConfigViewModel(ref);
});
