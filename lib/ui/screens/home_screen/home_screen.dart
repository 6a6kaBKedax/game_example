import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/style/app_fonts.dart';
import 'package:game_example/consts/style/app_gradients.dart';
import 'package:game_example/consts/style/app_shadows.dart';
import 'package:game_example/ui/global_widgets/global_button/global_button.dart';
import 'package:game_example/ui/pop_ups/game_menu_pop_up/game_menu_pop_up.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../consts/static_strings.dart';
import '../../../consts/style/app_assets_consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  AppImagesConsts.background,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GlobalButton(
                        onTap: () {
                          if (state is HomeLoadedState) {
                            context.read<HomeBloc>().add(const HomeInitSignalViewEvent('about'));
                            Navigator.of(context).pushNamed(Routes.webViewScreen);
                          }
                        },
                        radius: 18.1,
                        style: AppFonts.juraW400Size58White,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        text: 'SITE',
                        gradient: AppGradients.greenToDarkGreenGradient,
                        shadow: AppShadows.bigShadow,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 63.0),
                      GlobalButton(
                        onTap: () {
                          context.read<HomeBloc>().add(const HomeInitSignalViewEvent('game'));
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => const GameMenuPopUp(),
                          );
                          //Navigator.of(context).pushNamed(Routes.gameMenuScreen);
                        },
                        width: double.infinity,
                        radius: 18.1,
                        style: AppFonts.juraW400Size58White,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        text: 'GAME',
                        gradient: AppGradients.orangeToRedGradient,
                        shadow: AppShadows.bigShadow,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
