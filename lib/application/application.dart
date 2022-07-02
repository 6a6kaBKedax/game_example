import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/static_strings.dart';
import 'package:game_example/ui/screens/home_screen/home_screen.dart';
import 'package:game_example/ui/screens/web_view_screen/web_view_screen.dart';

import '../bloc/home_bloc/home_bloc.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const HomeInitEvent()),
      child: MaterialApp(
        routes: {
          Routes.webViewScreen: (BuildContext context) => const WebViewScreen(),
        },
        home: const HomeScreen(),
      ),
    );
  }
}
