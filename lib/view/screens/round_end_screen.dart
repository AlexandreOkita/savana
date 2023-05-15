import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/team.dart';
import 'package:savana/view/components/config_box.dart';
import 'package:savana/view/components/confirm_button.dart';
import 'package:savana/view/components/savana_scaffold.dart';
import 'package:savana/view/components/score_box.dart';
import 'package:savana/view/screens/new_round_screen.dart';
import 'package:savana/viewmodel/game_viewmodel.dart';

class RoundEndScreen extends ConsumerWidget {
  const RoundEndScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SavanaScaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ConfigBox(
              boxText: "Pontuação Total",
              child: Expanded(
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    ScoreBox(
                      score: ref.watch(gameViewModel).getTeamScore(TeamName.giraffe),
                      image: const AssetImage("images/girafa_icon.png"),
                    ),
                    const Spacer(flex: 1),
                    ScoreBox(
                      score: ref.watch(gameViewModel).getTeamScore(TeamName.zebra),
                      image: const AssetImage("images/zebra_icon.png"),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: ConfirmButton(onPressed: () {
              ref.watch(gameViewModel).updateRoundType();
              ref.watch(gameViewModel).resetRound();
              ref.watch(gameViewModel).updateStartingTeam();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NewRoundScreen()),
                ModalRoute.withName('/new_round'),
              );
            }),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
