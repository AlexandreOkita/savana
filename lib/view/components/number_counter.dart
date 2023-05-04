import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberCounter extends ConsumerWidget {
  final Function onUp;
  final Function onDown;
  final String value;

  const NumberCounter({
    Key? key,
    required this.onUp,
    required this.onDown,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          iconSize: 30,
          icon: const Icon(
            Icons.arrow_drop_up,
            color: Colors.white,
          ),
          onPressed: () => onUp(),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 40, fontFamily: "MouseMemoirs"),
        ),
        IconButton(
          iconSize: 30,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          onPressed: () => onDown(),
        ),
      ],
    );
  }
}
