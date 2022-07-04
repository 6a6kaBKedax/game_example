import 'package:flutter/material.dart';
import 'package:game_example/consts/style/app_fonts.dart';
import 'package:game_example/consts/style/app_gradients.dart';
import 'package:game_example/consts/style/app_shadows.dart';
import 'package:game_example/ui/global_widgets/global_button/global_button.dart';

import '../../../consts/static_strings.dart';

class GameMenuPopUp extends StatelessWidget {
  const GameMenuPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35.0,
        vertical: MediaQuery.of(context).size.height * 0.15,
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: AppGradients.darkGreenToLightGreenGradient,
            border: Border.all(color: const Color(0xFF00FFC2)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34.0, right: 34.0, top: 20.0),
                  child: Column(
                    children: <Widget>[
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => AppGradients.lightGreenToYellowGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: Text(
                          'GAME',
                          style: AppFonts.juraW400Size64Green,
                        ),
                      ),
                      const SizedBox(height: 61.0),
                      GlobalButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.snakeScreen);
                        },
                        activateOnHoldFunctionality: true,
                        border: true,
                        width: 308.0,
                        height: 76.0,
                        radius: 61.0,
                        text: 'new game',
                        style: AppFonts.juraW400Size36White,
                        gradient: AppGradients.darkGreenWithOpacityGradient,
                        onHoverGradient: AppGradients.darkGreenToExtraDarkGreenGradient,
                        shadow: AppShadows.mediumShadow,
                        onHoverShadow: AppShadows.mediumShadowBlue,
                      ),
                      const SizedBox(height: 26.7),
                      GlobalButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.snakeScreen);
                        },
                        activateOnHoldFunctionality: true,
                        border: true,
                        width: 308.0,
                        height: 76.0,
                        radius: 61.0,
                        text: 'continue',
                        style: AppFonts.juraW400Size36White,
                        gradient: AppGradients.darkGreenWithOpacityGradient,
                        onHoverGradient: AppGradients.darkGreenToExtraDarkGreenGradient,
                        shadow: AppShadows.mediumShadow,
                        onHoverShadow: AppShadows.mediumShadowBlue,
                      ),
                      const SizedBox(height: 26.7),
                      GlobalButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.historyScreen);
                        },
                        activateOnHoldFunctionality: true,
                        border: true,
                        width: 308.0,
                        height: 76.0,
                        radius: 61.0,
                        text: 'history',
                        style: AppFonts.juraW400Size36White,
                        gradient: AppGradients.darkGreenWithOpacityGradient,
                        onHoverGradient: AppGradients.darkGreenToExtraDarkGreenGradient,
                        shadow: AppShadows.mediumShadow,
                        onHoverShadow: AppShadows.mediumShadowBlue,
                      ),
                      const SizedBox(height: 26.7),
                      GlobalButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.settingsScreen);
                        },
                        activateOnHoldFunctionality: true,
                        border: true,
                        width: 308.0,
                        height: 76.0,
                        radius: 61.0,
                        text: 'settings',
                        style: AppFonts.juraW400Size36White,
                        gradient: AppGradients.darkGreenWithOpacityGradient,
                        onHoverGradient: AppGradients.darkGreenToExtraDarkGreenGradient,
                        shadow: AppShadows.mediumShadow,
                        onHoverShadow: AppShadows.mediumShadowBlue,
                      ),
                      const SizedBox(height: 70.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
