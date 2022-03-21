import 'package:flutter/material.dart';
import 'package:square_progress_bar/square_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // The progress value needs to be in a range from 0.0 to 1.0
  double _progress = 0.0;
  // The percentage label range is from 0 to 100, By multiply _progress by 100.
  String _percentageLabel = "0%";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square Progress Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SquareProgressBar(
                width: 100, // default: max available space
                height: 100, // default: max available space
                progress:
                    _progress, // provide the progress in a range from 0.0 to 1.0
                isAnimation:
                    false, // default: false, animate the progress of the bar
                solidBarColor: Colors.amber, // default: blue, main bar color
                emptyBarColor: Colors.orange
                    .withOpacity(0.2), // default: gray, empty bar color
                strokeWidth: 20, // default: 15, bar width
                barStrokeCap:
                    StrokeCap.round, // default: StrokeCap.round, bar head shape
                isRtl: false, // default: false, bar start point
                gradientBarColor: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Colors.red, Colors.amber],
                  tileMode: TileMode.repeated,
                ), // default: null, if you pass gradient color it will be used instead of solid color for the main bar
                child: Center(
                  child: Text(
                    _percentageLabel,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Slider(
                  min: 0.0,
                  max: 1.0,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.orange.withOpacity(0.2),
                  thumbColor: Colors.orange,
                  value: _progress,
                  onChanged: (value) {
                    setState(() {
                      _progress = value;
                      final int percentage = (_progress * 100).toInt();
                      _percentageLabel = "$percentage%";
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
