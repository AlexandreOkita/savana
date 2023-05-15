import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreBox extends ConsumerWidget {
  final int score;
  final ImageProvider image;
  const ScoreBox({required this.score, required this.image, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image(
            image: image,
          ),
        ),
        Text(score.toString(), style: Theme.of(context).textTheme.displayLarge)
      ],
    );
  }
}
