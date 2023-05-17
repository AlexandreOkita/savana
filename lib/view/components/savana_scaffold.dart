import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavanaScaffold extends ConsumerWidget {
  final Widget body;
  final bool showAppBar;
  final bool showLeaves;
  const SavanaScaffold(
      {this.showAppBar = true, this.showLeaves = true, required this.body, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: showAppBar
              ? AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                )
              : null,
          body: body,
        ),
        showLeaves
            ? Positioned(
                right: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset(
                  "images/folhas.png",
                  scale: 1.2,
                ),
              )
            : const SizedBox(),
        showLeaves
            ? Positioned(
                top: MediaQuery.of(context).size.height * 0.9,
                child: Image.asset("images/folha_rotacionada.png"),
              )
            : const SizedBox(),
      ],
    );
  }
}
