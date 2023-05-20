import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/constants/colors.dart';

class TextButton extends ConsumerWidget {
  final Function onClick;
  final String text;
  const TextButton({required this.onClick, required this.text, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Text(
        text,
        style: const TextStyle(color: errorColor, fontSize: 20),
      ),
      onTap: () => onClick,
    );
  }
}
