import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/config_box.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/number_counter.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/write_word_screen.dart';
import 'package:savana/viewmodel/game_config_viewmodel.dart';

class GameConfigScreen extends ConsumerWidget {
  const GameConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: ConfigBox(
                    boxText: "Palavras por pessoa",
                    configBoxTextSize: ConfigBoxTextSize.small,
                    child: NumberCounter(
                      value: ref.watch(gameConfigViewModel).getWordsPerPlayer().toString(),
                      onUp: () => ref.read(gameConfigViewModel).increaseWordsPerPlayer(),
                      onDown: () => ref.read(gameConfigViewModel).decreaseWordsPerPlayer(),
                    )),
              ),
            ),
            Expanded(
              flex: 3,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: ConfigBox(
                  boxText: "Tempo de cada rodada",
                  configBoxTextSize: ConfigBoxTextSize.small,
                  child: NumberCounter(
                    value: ref.watch(gameConfigViewModel).getTimePerRoundFormated(),
                    onUp: () => ref.read(gameConfigViewModel).increaseMinutesPerRound(),
                    onDown: () => ref.read(gameConfigViewModel).decreaseMinutesPerRound(),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Tempo previsto da partida: ${ref.watch(gameConfigViewModel).getTimeEstimative()} min",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  ConfirmButton(
                      onPressed: () => {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const WriteWordScreen()),
                              ModalRoute.withName('/words'),
                            )
                          }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
