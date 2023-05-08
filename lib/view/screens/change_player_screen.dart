import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/write_word_screen.dart';
import 'package:savana/viewmodel/words_viewmodel.dart';

class ChangePlayerScreen extends ConsumerWidget {
  const ChangePlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "${ref.read(wordsViewModel).getRemainingPlayersQuantity()} jogadores restantes",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          "Passe o celular para o jogador da direita!",
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        ConfirmButton(onPressed: () {
          ref.read(wordsViewModel).flushPlayerWords();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const WriteWordScreen()),
            ModalRoute.withName('/words'),
          );
        }),
      ],
    ));
  }
}
