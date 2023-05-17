import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/model/team.dart';
import 'package:savana/viewmodel/game_viewmodel.dart';

class NewTeamScreen extends ConsumerWidget {
  final Function onStart;

  const NewTeamScreen({required this.onStart, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final team = ref.watch(gameViewModel).getCurrentTeamName();

    final boxColor = team == TeamName.zebra ? Colors.black : const Color(0xffA35525);
    final fontColor = team == TeamName.zebra ? Colors.white : const Color(0xffFFDA9C);
    final imgLocation = team == TeamName.zebra ? "assets/images/zebra.png" : "assets/images/giraffe.png";

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imgLocation), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: boxColor,
              ),
              height: height * 0.2,
              width: width * 0.8,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  "VEZ DAS ${team.getName()}",
                  style: TextStyle(
                    fontFamily: "MouseMemoirs",
                    fontSize: 40,
                    color: fontColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Um novo jogador deve ser o professor",
                  style: TextStyle(
                    fontFamily: "MouseMemoirs",
                    fontSize: 30,
                    color: fontColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
            ),
            InkWell(
              onTap: () => onStart(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boxColor,
                ),
                height: height * 0.25,
                width: width * 0.8,
                child: Center(
                  child: Text(
                    "TOQUE PARA COMEÇAR",
                    style: TextStyle(
                      fontFamily: "MouseMemoirs",
                      fontSize: 60,
                      color: fontColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
              width: width * 0.7,
            )
          ],
        ));
  }
}
