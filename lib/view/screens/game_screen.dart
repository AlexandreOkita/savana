import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/screens/new_team_screen.dart';
import 'package:savana/view/screens/round_end_screen.dart';
import 'package:savana/viewmodel/game_config_viewmodel.dart';
import 'package:savana/viewmodel/game_viewmodel.dart';
import 'package:savana/viewmodel/sound_viewmodel.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends ConsumerState<GameScreen> {
  int seconds = 60;
  bool didStarted = false;
  Timer? timer;

  void startTimer() {
    setState(() {
      seconds = ref.read(gameConfigViewModel).getTimePerRoundInSeconds();
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        ref.watch(gameViewModel).updateCurrentTeam();
        timer.cancel();
        setState(() {
          didStarted = false;
        });
      } else {
        ref.read(soundViewModel).playClickSound();
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.watch(gameViewModel);

    return SavanaScaffold(
      showAppBar: didStarted,
      showLeaves: didStarted,
      body: didStarted
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        viewmodel.getCurrentWord(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        seconds.toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                  ConfirmButton(
                    useClickSound: false,
                    onPressed: () {
                      ref.read(soundViewModel).playCorrectSound();
                      viewmodel.addCorrectWord();
                      viewmodel.addPointToCurrentTeam();
                      if (viewmodel.roundEnded()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const RoundEndScreen()),
                          ModalRoute.withName('/round_end'),
                        );
                      } else {
                        viewmodel.getNewWord();
                      }
                    },
                    buttonText: "ACERTOU",
                  )
                ],
              ),
            )
          : NewTeamScreen(
              onStart: () {
                setState(() {
                  viewmodel.getNewWord();
                  startTimer();
                  didStarted = true;
                });
              },
            ),
    );
  }
}
