import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/static_strings.dart';
import 'package:game_example/ui/screens/home_screen/home_screen.dart';
import 'package:game_example/ui/screens/settings_screen/settings_screen.dart';
import 'package:game_example/ui/screens/snake_screen/snake_screen.dart';
import 'package:game_example/ui/screens/web_view_screen/web_view_screen.dart';

import '../bloc/game_bloc/game_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../ui/screens/history_screen/history_screen.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(const HomeInitEvent()),
        ),
        BlocProvider(
          create: (context) => GameBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          context.read<GameBloc>().add(const GameInitEvent());
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              Routes.webViewScreen: (BuildContext context) => const WebViewScreen(),
              Routes.historyScreen: (BuildContext context) => const HistoryScreen(),
              Routes.snakeScreen: (BuildContext context) => const SnakeScreen(),
              Routes.settingsScreen: (BuildContext context) => const SettingsScreen(),
            },
            home: const HomeScreen(),
          );
        }
      ),
    );
  }
}
