import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/bloc/game_bloc/game_bloc.dart';
import 'package:game_example/consts/style/app_assets_consts.dart';

import '../../../consts/enums/direction_enum.dart';

class SnakeScreen extends StatefulWidget {
  const SnakeScreen({Key? key}) : super(key: key);

  @override
  _SnakeScreenState createState() => _SnakeScreenState();
}

class _SnakeScreenState extends State<SnakeScreen> {
  final int squaresPerRow = 20;
  final int squaresPerCol = 20;
  static const TextStyle fontStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  final randomGen = Random();

  List<List<int>> snake = [
    [0, 1],
    [0, 0]
  ];
  List<int> food = [0, 2];
  Direction direction = Direction.up;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != Direction.up && details.delta.dy > 0) {
                  direction = Direction.down;
                } else if (direction != Direction.down && details.delta.dy < 0) {
                  direction = Direction.up;
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != Direction.left && details.delta.dx > 0) {
                  direction = Direction.right;
                } else if (direction != Direction.right && details.delta.dx < 0) {
                  direction = Direction.left;
                }
              },
              child: AspectRatio(
                aspectRatio: squaresPerRow / (squaresPerCol + 5),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: squaresPerRow,
                    ),
                    itemCount: squaresPerRow * squaresPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      final Color? color;
                      final int x = index % squaresPerRow;
                      final int y = (index / squaresPerRow).floor();

                      bool isSnakeBody = false;
                      for (var pos in snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }

                      if (snake.first[0] == x && snake.first[1] == y) {
                        color = Colors.green;
                      } else if (isSnakeBody) {
                        color = Colors.green[200];
                      } else if (food[0] == x && food[1] == y) {
                        color = Colors.red;
                      } else {
                        color = Colors.grey[800];
                      }

                      return Container(
                        margin: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                    child: Container(
                      color: isPlaying ? Colors.red : Colors.blue,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        isPlaying ? 'End' : 'Start',
                        style: fontStyle,
                      ),
                    ),
                    onTap: () {
                      if (isPlaying) {
                        isPlaying = false;
                      } else {
                        startGame();
                      }
                    }),
                Text(
                  'Score: ${snake.length - 2}',
                  style: fontStyle,
                ),
                InkWell(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Back',
                      style: fontStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void startGame() {
    const duration = Duration(milliseconds: 300);

    snake = [
      // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case Direction.up:
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case Direction.down:
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;

        case Direction.left:
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case Direction.right:
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  void createFood() {
    context.read<GameBloc>().add(const GameMakeSoundEvent(AppSoundsConsts.yes));
    food = [randomGen.nextInt(squaresPerRow), randomGen.nextInt(squaresPerCol)];
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squaresPerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squaresPerRow) {
      return true;
    }

    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;
    context.read<GameBloc>().add(const GameMakeSoundEvent(AppSoundsConsts.no));
    context.read<GameBloc>().add(GameAddToHistoryEvent(snake.length - 2));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: const TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              InkWell(
                onTap: Navigator.of(context).pop,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Close'),
                ),
              ),
            ],
          );
        });
  }
}
