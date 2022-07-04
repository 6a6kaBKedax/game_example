import 'package:flutter/material.dart';
import 'package:game_example/consts/style/app_fonts.dart';
import 'package:game_example/consts/style/app_gradients.dart';
import 'package:game_example/consts/style/app_shadows.dart';
import 'package:game_example/ui/global_widgets/global_button/global_button.dart';

import '../../../consts/static_strings.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isActive = false;
  double height = 90.0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'AppBar',
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          decoration: const BoxDecoration(gradient: AppGradients.lightGreenToBlueGradient),
          duration: const Duration(milliseconds: 300),
          height: height,
          child: isActive
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25.0,
                          top: 25.0,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              height = 90.0;
                              isActive = false;
                            });
                          },
                          icon: const Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: 45.0,
                          ),
                        ),
                      ),
                    ),
                    GlobalButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.snakeScreen);
                      },
                      text: 'new game',
                      style: AppFonts.juraW400Size36White,
                      activateOnHoldFunctionality: true,
                      onHoverTextStyle: AppFonts.juraW400Size36Green,
                    ),
                    const SizedBox(height: 28.0),
                    GlobalButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.snakeScreen);
                      },
                      text: 'continue',
                      style: AppFonts.juraW400Size36White,
                      activateOnHoldFunctionality: true,
                      onHoverTextStyle: AppFonts.juraW400Size36Green,
                    ),
                    const SizedBox(height: 31.0),
                    GlobalButton(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Routes.historyScreen);
                      },
                      text: 'history',
                      style: AppFonts.juraW400Size36White,
                      activateOnHoldFunctionality: true,
                      onHoverTextStyle: AppFonts.juraW400Size36Green,
                    ),
                    const SizedBox(height: 27.0),
                    GlobalButton(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Routes.settingsScreen);
                      },
                      text: 'settings',
                      style: AppFonts.juraW400Size36White,
                      activateOnHoldFunctionality: true,
                      onHoverTextStyle: AppFonts.juraW400Size36Green,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(width: 81.0),
                    Text(
                      widget.title,
                      style: AppFonts.juraW400Size36White,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 25.0,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            height = 412.0;
                            isActive = true;
                          });
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 45.0,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
