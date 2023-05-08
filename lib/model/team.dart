class Team {
  final int totalScore;
  final int currentRoundScore;
  final TeamName teamName;

  Team({required this.totalScore, required this.currentRoundScore, required this.teamName});
}

enum TeamName { giraffe, zebra }

extension TeamNameStrings on TeamName {
  String getName() {
    switch (this) {
      case TeamName.giraffe:
        return "GIRAFAS";
      case TeamName.zebra:
        return "ZEBRAS";
    }
  }
}
