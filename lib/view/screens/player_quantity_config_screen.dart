import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/config_box.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/number_counter.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/game_config_screen.dart';
import 'package:savana/viewmodel/game_config_viewmodel.dart';

class PlayerQuantityConfigScreen extends ConsumerWidget {
  const PlayerQuantityConfigScreen({super.key});

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
                  heightFactor: 0.6,
                  widthFactor: 0.8,
                  child: ConfigBox(
                    boxText: "Número de jogadores",
                    child: NumberCounter(
                      value: ref.watch(gameConfigViewModel).getPlayerQtt(),
                      onUp: () => ref.read(gameConfigViewModel).increasePlayerQtt(),
                      onDown: () => ref.read(gameConfigViewModel).decreasePlayerQtt(),
                    ),
                  )),
            ),
            Flexible(
              flex: 1,
              child: ConfirmButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameConfigScreen()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
