import 'package:dostx/palette.dart';
import 'package:dostx/sign_in.dart';
import 'package:dostx/sign_up_first_page.dart';
import 'package:flutter/material.dart';
import 'package:dostx/bloc/bloc_provider.dart';
import 'package:dostx/bloc/mainbloc.dart';

void main() {
  mainBloc bloc = mainBloc();
    runApp(
      MyApp(bloc),
    );
}

class MyApp extends StatelessWidget {
  final mainBloc bloc;
  const MyApp(this.bloc, {Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignUpFirst(),
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: ColorOptions.lightblue,
          ),
        ),
      ),
    );
  }
}
