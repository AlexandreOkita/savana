import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/viewmodel/providers/configuration_providers.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';

class WordsViewModel {
  final ProviderRef ref;

  WordsViewModel(this.ref);

  addWordToPlayerPool(String word) {
    final List<String> newList = [...ref.read(playerWordsProvider), word];
    ref.read(playerWordsProvider.notifier).state = newList;
  }

  removeWordFromPlayerPool(String word) {
    ref.read(playerWordsProvider).removeWhere((element) => element == word);
    final List<String> newList = [...ref.read(playerWordsProvider)];
    ref.read(playerWordsProvider.notifier).state = newList;
  }

  int getRemainingWordsQuantity() {
    return ref.watch(wordsPerPlayerProvider) - ref.watch(playerWordsProvider).length;
  }
}

final wordsViewModel = Provider<WordsViewModel>((ref) {
  return WordsViewModel(ref);
});
