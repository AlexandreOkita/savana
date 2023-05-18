class Sounds {
  final Map<String, int> backgroundSounds;
  final Map<String, int> effectSounds;

  Sounds({required this.backgroundSounds, required this.effectSounds});
}

const _assetBase = "assets/sounds";

enum BackgroundSounds { click }

enum EffectSounds { click, correct, finish, winbanjo }

extension BackgroundSoundsExtension on BackgroundSounds {
  String getAsset() {
    return "$_assetBase/$name.mp3";
  }
}

extension EffectSoundsExtension on EffectSounds {
  String getAsset() {
    return "$_assetBase/$name.mp3";
  }
}
