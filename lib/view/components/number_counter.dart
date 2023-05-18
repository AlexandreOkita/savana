import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/sounds.dart';
import 'package:savana/viewmodel/sound_viewmodel.dart';

class NumberCounter extends ConsumerWidget {
  final Function onUp;
  final Function onDown;
  final bool showDown;
  final bool showUp;
  final String value;

  const NumberCounter({
    Key? key,
    this.showDown = true,
    this.showUp = true,
    required this.onUp,
    required this.onDown,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        showUp
            ? IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(soundViewModel).playEffectSound(EffectSounds.click);
                  onUp();
                },
              )
            : const SizedBox(height: 43),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 40, fontFamily: "MouseMemoirs"),
        ),
        showDown
            ? IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(soundViewModel).playEffectSound(EffectSounds.click);
                  onDown();
                },
              )
            : const SizedBox(height: 43),
      ],
    );
  }
}
