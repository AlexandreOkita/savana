import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundpool/soundpool.dart';

final soundpoolProvider = Provider<Soundpool>((ref) {
  return Soundpool.fromOptions();
});

final clickSoundProvider = Provider<Future<int>>((ref) async {
  return await rootBundle.load("sounds/click.mp3").then((ByteData soundData) {
    return ref.read(soundpoolProvider).load(soundData);
  });
});
