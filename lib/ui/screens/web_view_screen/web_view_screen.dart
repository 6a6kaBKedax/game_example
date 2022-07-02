import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/bloc/home_bloc/home_bloc.dart';
import 'package:game_example/consts/style/app_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Web View',
          style: AppFonts.juraW400Size40White,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: context.read<HomeBloc>().state.link,
      ),
    );
  }
}
