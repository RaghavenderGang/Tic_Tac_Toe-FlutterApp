import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_button.dart';
import 'package:tic_tac_toe/check_status.dart';
import 'package:tic_tac_toe/custom_dialog.dart';
import 'package:tic_tac_toe/machine.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;
  int flag;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    // List<int> player1 = [];
    // List<int> player2 = [];
    player1 = List();
    player2 = List();
    activePlayer = 1;
    flag = 0;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];

    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      //print(gb.id);
      if (flag == 0) {
        if (activePlayer == 1) {
          gb.text = 'X';
          gb.bg = Colors.red;
          activePlayer = 2;
          player1.add(gb.id);
          //print(player1);
          //print(player2);
        } else {
          gb.text = 'O';
          gb.bg = Colors.black;
          activePlayer = 1;
          player2.add(gb.id);
          //print(player1);
          //print(player2);
        }
        gb.enabled = false;

        int winner = checkStatus(player1, player2);

        if (winner != 0) {
          if (winner == -10) {
            flag = 1;
            showDialog(
                context: context,
                builder: (_) => new CustomDialog("Player 1 Won",
                    "Press the reset button to start again.", resetGame));
          } else {
            flag = 2;
            showDialog(
                context: context,
                builder: (_) => new CustomDialog("Player 2 Won",
                    "Press the reset button to start again.", resetGame));
          }
        }

        if (winner == 0) {
          if (buttonsList.every((element) => element.text != "")) {
            showDialog(
                context: context,
                builder: (_) => CustomDialog("Game Draw",
                    "Press the reset button to start again", resetGame));
          } else {
            activePlayer == 2 ? autoPlay() : null;
          }
        }
      } else {
        if (flag == 1) {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog("Player 1 Won",
                  "Press the reset button to start again.", resetGame));
        } else {
          showDialog(
              context: context,
              builder: (_) => new CustomDialog("Player 2 Won",
                  "Press the reset button to start again.", resetGame));
        }
      }
    });
  }

  void autoPlay() {
    int i = machine(player1, player2);

    playGame(buttonsList[i - 1]);
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 9.0),
              padding: const EdgeInsets.all(10.0),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: buttonsList[i].enabled
                      ? () => playGame(buttonsList[i])
                      : null,
                  child: Text(
                    buttonsList[i].text,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  color: buttonsList[i].bg,
                  disabledColor: buttonsList[i].bg,
                  elevation: 5,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 175,
            child: RaisedButton(
              onPressed: resetGame,
              child: Text(
                "Reset",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              elevation: 5,
              color: Colors.green,
            ),
          ),
          SizedBox(
            height: 35,
          )
        ],
      )),
    );
  }
}
