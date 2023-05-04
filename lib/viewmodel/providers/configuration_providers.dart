import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/time.dart';

final playerQuantityProvider = StateProvider<int>((ref) {
  return 4;
});

final wordsPerPlayerProvider = StateProvider<int>((ref) {
  return 3;
});

final timePerRoundProvider = StateProvider<Time>((ref) {
  return Time(minutes: 1);
});
