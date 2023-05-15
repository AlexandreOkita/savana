import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/components/word_list.dart';
import 'package:savana/view/components/write_word_field.dart';
import 'package:savana/view/screens/change_player_screen.dart';
import 'package:savana/view/screens/start_game_screen.dart';
import 'package:savana/viewmodel/game_config_viewmodel.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';
import 'package:savana/viewmodel/words_viewmodel.dart';

class WriteWordScreen extends ConsumerWidget {
  const WriteWordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
        body: Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: ref.read(wordsViewModel).getRemainingWordsQuantity() == 0
                ? Text(
                    "Todas as palavras foram usadas",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: WriteWordField(
                      title: "Escreva uma nova palavra",
                      detail:
                          "Faltam ${ref.read(wordsViewModel).getRemainingWordsQuantity()} palavras",
                      onSend: (text) {
                        ref.read(wordsViewModel).addWordToPlayerPool(text);
                      },
                    ),
                  ),
          ),
        ),
        Expanded(
            flex: 4,
            child: WordList(
              words: ref.watch(playerWordsProvider),
              title: "Palavras já escolhidas",
              onRemove: (String word) {
                ref.read(wordsViewModel).removeWordFromPlayerPool(word);
              },
            )),
        Expanded(
          flex: 1,
          child: ref.read(wordsViewModel).getRemainingWordsQuantity() == 0
              ? ConfirmButton(onPressed: () {
                  ref.read(wordsViewModel).flushPlayerWords();
                  ref.read(wordsViewModel).increasePlayersDone();
                  if (ref.read(gameConfigViewModel).allPlayerAreDone()) {
                    return Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const StartGameScreen()),
                      ModalRoute.withName('/start_game'),
                    );
                  }
                  return Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const ChangePlayerScreen()),
                    ModalRoute.withName('/change_player'),
                  );
                })
              : const SizedBox(),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    ));
  }
}
