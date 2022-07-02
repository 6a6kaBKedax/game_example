import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/style/app_fonts.dart';
import 'package:game_example/consts/style/app_gradients.dart';
import 'package:game_example/consts/style/app_images_consts.dart';
import 'package:game_example/consts/style/app_shadows.dart';
import 'package:game_example/ui/global_widgets/global_button/global_button.dart';

import '../../../bloc/home_bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const HomeInitEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Image.asset(
                  AppImagesConsts.background,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GlobalButton(
                        onTap: () {},
                        radius: 18.1,
                        style: AppFonts.juraW400Size58White,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 92.0,
                          vertical: 15.0,
                        ),
                        text: 'SITE',
                        gradient: AppGradients.greenToDarkGreenGradient,
                        shadow: AppShadows.bigShadow,
                      ),
                      const SizedBox(height: 63.0),
                      GlobalButton(
                        onTap: () {},
                        radius: 18.1,
                        style: AppFonts.juraW400Size58White,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 76.0,
                          vertical: 15.0,
                        ),
                        text: 'GAME',
                        gradient: AppGradients.orangeToRedGradient,
                        shadow: AppShadows.bigShadow,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
