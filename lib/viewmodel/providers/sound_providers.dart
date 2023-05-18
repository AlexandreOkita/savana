import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/sounds.dart';
import 'package:soundpool/soundpool.dart';

final soundpoolBackgroundProvider = Provider<Soundpool>((ref) {
  return Soundpool.fromOptions();
});

final soundpoolEffectsProvider = Provider<Soundpool>((ref) {
  return Soundpool.fromOptions();
});

final soundsProvider = Provider<Future<Sounds>>((ref) async {
  final Map<String, int> backgroundSounds = {};
  final Map<String, int> effectSounds = {};

  for (BackgroundSounds sound in BackgroundSounds.values) {
    final soundData = await rootBundle.load(sound.getAsset());
    backgroundSounds
        .addAll({sound.name: await ref.read(soundpoolBackgroundProvider).load(soundData)});
  }

  for (EffectSounds sound in EffectSounds.values) {
    final soundData = await rootBundle.load(sound.getAsset());
    effectSounds.addAll({sound.name: await ref.read(soundpoolEffectsProvider).load(soundData)});
  }

  return Sounds(backgroundSounds: backgroundSounds, effectSounds: effectSounds);
});
