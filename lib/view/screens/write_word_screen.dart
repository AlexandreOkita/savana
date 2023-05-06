import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/components/word_list.dart';
import 'package:savana/view/components/write_word_field.dart';
import 'package:savana/viewmodel/providers/game_providers.dart';
import 'package:savana/viewmodel/words_viewmodel.dart';

class WriteWordScreen extends ConsumerWidget {
  const WriteWordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
        body: Column(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: WriteWordField(
            title: "Escreva uma nova palavra",
            detail: "Faltam ${ref.read(wordsViewModel).getRemainingWordsQuantity()} palavras",
            onSend: (text) {
              ref.read(wordsViewModel).addWordToPlayerPool(text);
            },
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
            flex: 5,
            child: WordList(
              words: ref.watch(playerWordsProvider),
              title: "Palavras já escolhidas",
              onRemove: (String word) {
                ref.read(wordsViewModel).removeWordFromPlayerPool(word);
              },
            )),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    ));
  }
}
