import 'dart:io';
import 'dart:math';

main() {
  print('Choose number of rounds to win: ');
  int number = int.parse(stdin.readLineSync().toString());
  List score = [0, 0];
  while (!score.any((element) => element == number)) {
    print('rock, scissors, paper? ');
    String userChoice = stdin.readLineSync().toString();
    String compChoice =
        ['rock', 'scissors', 'paper'][Random.secure().nextInt(3)];
    score = compareOption(compChoice, userChoice, score);
    print('Score: user ${score[0]} - ${score[1]} computer\n${"-" * 20}');
  }
  (score[0] == number) ? print('You win :)') : print('Computer win :(');
}

compareOption(comp, user, score) {
  List roundScore = List<int>.filled(2, 0);
  Map rules = {
    'rock': {'beat': 'scissors', 'lose': 'paper'},
    'scissors': {'beat': 'paper', 'lose': 'rock'},
    'paper': {'beat': 'rock', 'lose': 'scissors'},
  };
  if (user == comp) {
    print("Both of you chose $user.");
  } else {
    if (rules[user]['beat'] == comp) {
      print("$user beats $comp. You won the round!");
      roundScore = [1, 0];
    } else if (rules[user]['lose'] == comp) {
      print("$user loses to $comp. the computer won the round!");
      roundScore = [0, 1];
    }
  }
  return List.generate(
      score.length, (index) => score[index] + roundScore[index]);
}
