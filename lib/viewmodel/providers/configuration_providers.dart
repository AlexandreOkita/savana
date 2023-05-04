import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerQuantityProvider = StateProvider<int>((ref) {
  return 4;
});

final wordsPerPlayerProvider = StateProvider<int>((ref) {
  return 3;
});

final minutesPerRoundProvider = StateProvider<int>((ref) {
  return 1;
});
