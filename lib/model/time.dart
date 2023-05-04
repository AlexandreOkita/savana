class Time {
  final int minutes;
  final int seconds;

  Time({this.minutes = 0, this.seconds = 0});

  Time changeTimeInSeconds(int seconds) {
    int total = getTotalInSeconds() + seconds;
    int minutes = (total / 60).floor();
    return Time(minutes: minutes, seconds: total - (minutes * 60));
  }

  double getTotalInMinutes() {
    return minutes + seconds / 60;
  }

  int getTotalInSeconds() {
    return minutes * 60 + seconds;
  }
}
