import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/round_type.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/viewmodel/game_viewmodel.dart';

class NewRoundScreen extends ConsumerWidget {
  const NewRoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoundType = ref.watch(gameViewModel).getRoundType();

    return SavanaScaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          currentRoundType.getName(),
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          currentRoundType.getDefinition(),
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        ConfirmButton(
            buttonText: "COMEÇAR",
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/game",
                  ModalRoute.withName('/game'),
                )),
      ]),
    );
  }
}
