import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundpool/soundpool.dart';

final soundpoolProvider = Provider<Soundpool>((ref) {
  return Soundpool.fromOptions();
});

final soundpoolEffectsProvider = Provider<Soundpool>((ref) {
  return Soundpool.fromOptions();
});

final clickSoundProvider = Provider<Future<int>>((ref) async {
  return await rootBundle.load("assets/sounds/click.mp3").then((ByteData soundData) {
    return ref.read(soundpoolProvider).load(soundData);
  });
});

final correctSoundProvider = Provider<Future<int>>((ref) async {
  return await rootBundle.load("assets/sounds/correct.mp3").then((ByteData soundData) {
    return ref.read(soundpoolEffectsProvider).load(soundData);
  });
});
