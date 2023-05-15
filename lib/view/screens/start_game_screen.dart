import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/new_round_screen.dart';
import 'package:savana/viewmodel/game_viewmodel.dart';

class StartGameScreen extends ConsumerWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Todas as palavras foram inseridas",
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          "Dividam-se em equipes para começar!",
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        ConfirmButton(
            buttonText: "COMEÇAR",
            onPressed: () {
              ref.watch(gameViewModel).updateStartingTeam();
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NewRoundScreen()),
                ModalRoute.withName('/new_round'),
              );
            }),
      ]),
    );
  }
}
