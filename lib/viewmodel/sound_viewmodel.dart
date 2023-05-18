import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/sounds.dart';
import 'package:savana/viewmodel/providers/sound_providers.dart';

class SoundViewModel {
  final ProviderRef _ref;

  SoundViewModel(this._ref);

  void playBackgroundSound(BackgroundSounds sound) async {
    final sounds = await _ref.read(soundsProvider);
    _ref.read(soundpoolBackgroundProvider).play(sounds.backgroundSounds[sound.name]!);
  }

  void playEffectSound(EffectSounds sound) async {
    final sounds = await _ref.read(soundsProvider);
    _ref.read(soundpoolEffectsProvider).play(sounds.effectSounds[sound.name]!);
  }
}

final soundViewModel = Provider<SoundViewModel>((ref) {
  return SoundViewModel(ref);
});
