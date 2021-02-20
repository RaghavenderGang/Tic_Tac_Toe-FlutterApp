import 'dart:math';

import 'package:tic_tac_toe/check_status.dart';

bool isFull(var p1, var p2) {
  for (int i = 1; i < 10; i++) {
    if (!p1.contains(i) && !p2.contains(i)) return false;
  }
  return true;
}

int minimax(var p1, var p2, bool isMax) {
  int score = checkStatus(p1, p2);

  if (score == 10) return score;
  if (score == -10) return score;
  if (isFull(p1, p2) == true) return 0;

  if (isMax) {
    int best = -100;

    for (int i = 1; i < 10; i++) {
      if (!p1.contains(i) && !p2.contains(i)) {
        p2.add(i);
        best = max(best, minimax(p1, p2, !isMax));
        p2.remove(i);
      }
    }
    return best;
  } else {
    int best = 100;

    for (int i = 1; i < 10; i++) {
      if (!p1.contains(i) && !p2.contains(i)) {
        p1.add(i);
        best = min(best, minimax(p1, p2, !isMax));
        p1.remove(i);
      }
    }
    return best;
  }
}

int machine(var player1, var player2) {
  var p1 = player1;
  var p2 = player2;

  int bestVal = -100;
  int moveVal;
  int bestMove = -1;

  for (int i = 1; i < 10; i++) {
    if (!p1.contains(i) && !p2.contains(i)) {
      p2.add(i);
      moveVal = minimax(p1, p2, false);
      p2.remove(i);

      if (moveVal > bestVal) {
        bestMove = i;
        bestVal = moveVal;
      }
    }
  }
  //print("best move $bestMove , best val $bestVal");
  return bestMove;
}
