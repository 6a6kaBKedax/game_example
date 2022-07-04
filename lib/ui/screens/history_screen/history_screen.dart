import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/style/app_fonts.dart';

import '../../../bloc/game_bloc/game_bloc.dart';
import '../../global_widgets/custom_app_bar/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF0B3830),
          body: Column(
            children: [
              const CustomAppBar(title: 'history'),
              state.results != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 3.0,
                            child: ListTile(
                              tileColor: Colors.green,
                              title: Text(
                                state.results![index].points.toString(),
                                style: AppFonts.juraW400Size58White,
                              ),
                              subtitle: Text(
                                state.results![index].time.toString(),
                                style: AppFonts.juraW400Size40White,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: state.results!.length,
                    )
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                          'No history',
                          style: AppFonts.juraW400Size36White,
                        ),
                      ),
                  )
            ],
          ),
        );
      },
    );
  }
}
