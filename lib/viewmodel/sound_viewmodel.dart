import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/viewmodel/providers/sound_providers.dart';

class SoundViewModel {
  final ProviderRef _ref;

  SoundViewModel(this._ref);

  void playClickSound() async {
    int soundId = await _ref.read(clickSoundProvider);
    _ref.read(soundpoolProvider).play(soundId);
  }

  void playCorrectSound() async {
    int soundId = await _ref.read(correctSoundProvider);
    _ref.read(soundpoolEffectsProvider).play(soundId);
  }
}

final soundViewModel = Provider<SoundViewModel>((ref) {
  return SoundViewModel(ref);
});
