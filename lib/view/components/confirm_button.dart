import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/constants/colors.dart';

class ConfirmButton extends ConsumerWidget {
  final String buttonText;
  final Function onPressed;
  const ConfirmButton({required this.onPressed, this.buttonText = "CONFIRMAR", super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onPressed(),
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
