int checkStatus(var player1, var player2) {
  var winner = 0;

  // row 1
  if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
    winner = -10;
  }
  if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
    winner = 10;
  }

  // row 2
  if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
    winner = -10;
  }
  if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
    winner = 10;
  }

  // row 3
  if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
    winner = -10;
  }
  if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
    winner = 10;
  }

  // col 1
  if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
    winner = -10;
  }
  if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
    winner = 10;
  }

  // col 2
  if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
    winner = -10;
  }
  if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
    winner = 10;
  }

  // col 3
  if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
    winner = -10;
  }
  if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
    winner = 10;
  }

  //diagonal
  if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
    winner = -10;
  }
  if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
    winner = 10;
  }

  if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
    winner = -10;
  }
  if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
    winner = 10;
  }
  return winner;
}
