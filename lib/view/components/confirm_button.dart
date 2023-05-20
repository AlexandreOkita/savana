import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/sounds.dart';
import 'package:savana/view/constants/colors.dart';
import 'package:savana/viewmodel/sound_viewmodel.dart';

class ConfirmButton extends ConsumerWidget {
  final String buttonText;
  final Function onPressed;
  final bool useClickSound;
  const ConfirmButton(
      {required this.onPressed,
      this.buttonText = "CONFIRMAR",
      this.useClickSound = true,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (useClickSound) ref.read(soundViewModel).playEffectSound(EffectSounds.button_click);
        onPressed();
      },
      child: Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
