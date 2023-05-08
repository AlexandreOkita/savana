import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavanaScaffold extends ConsumerWidget {
  final Widget body;
  final bool showAppBar;
  const SavanaScaffold({this.showAppBar = true, required this.body, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            )
          : null,
      body: body,
    );
  }
}
