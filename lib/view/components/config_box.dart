import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/constants/colors.dart';

class ConfigBox extends ConsumerWidget {
  final String boxText;
  final ConfigBoxTextSize configBoxTextSize;
  final Widget child;
  const ConfigBox({
    required this.boxText,
    this.configBoxTextSize = ConfigBoxTextSize.big,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: componentColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            boxText,
            style: configBoxTextSize.getTextSize(context),
            textAlign: TextAlign.center,
          ),
          child,
        ],
      ),
    );
  }
}

enum ConfigBoxTextSize { small, big }

extension GetTextSize on ConfigBoxTextSize {
  TextStyle? getTextSize(BuildContext context) {
    switch (this) {
      case ConfigBoxTextSize.big:
        return Theme.of(context).textTheme.displayLarge;
      case ConfigBoxTextSize.small:
        return Theme.of(context).textTheme.displaySmall;
      default:
        return Theme.of(context).textTheme.displayLarge;
    }
  }
}
