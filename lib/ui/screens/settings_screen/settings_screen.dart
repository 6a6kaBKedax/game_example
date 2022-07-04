import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/style/app_assets_consts.dart';
import 'package:game_example/ui/global_widgets/custom_app_bar/custom_app_bar.dart';

import '../../../bloc/game_bloc/game_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B3830),
      body: Column(children: <Widget>[
        const CustomAppBar(title: 'settings'),
        BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GestureDetector(
                child: Image.asset(
                  state.soundStatus ? AppImagesConsts.soundOn : AppImagesConsts.soundOff,
                ),
                onTap: () {
                  context.read<GameBloc>().add(const GameChangeSoundStatusEvent());
                },
              ),
            );
          },
        )
      ]),
    );
  }
}
