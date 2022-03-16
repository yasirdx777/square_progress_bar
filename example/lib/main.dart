import 'package:flutter/material.dart';
import 'package:square_progress_bar/square_progress_bar.dart';


const LinearGradient gradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[Colors.red, Colors.amber],
  tileMode: TileMode.repeated,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square Progress Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: SquareProgressBar(
              percentage: 0.7,
              isAnimation: true,
              gradientBarColor: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.red, Colors.amber],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
