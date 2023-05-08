import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerWordsProvider = StateProvider<List<String>>((ref) {
  return [];
});

final wordsPoolProvider = StateProvider<List<String>>((ref) {
  return [];
});

final playersDoneQuantityProvider = StateProvider<int>((ref) => 0);
