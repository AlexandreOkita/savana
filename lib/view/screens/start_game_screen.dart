import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/player_quantity_config_screen.dart';

class StartGameScreen extends ConsumerWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const PlayerQuantityConfigScreen()),
                      ModalRoute.withName('/game'),
                    )),
          ]),
    );
  }
}
