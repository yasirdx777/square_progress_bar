# Square progress bar because why not 😎

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Features

- Dynamic sizing
- Animated progress bar
- Gradient color progress bar
- Prgreess bar cap shape customization
- RTL support
- ✨Magic✨

![alt text](https://raw.githubusercontent.com/yasirdx777/square_progress_bar/main/img/square_progress_bar.gif)

## Installation
```yaml
dependencies:
  square_progress_bar: ^1.1.1
```
## Getting started
Just provide the progress in a range from 0.0 to 1.0 and you are set to go.

## Usage
```dart
              SquareProgressBar(
                width: 100, // default: max available space
                height: 100, // default: max available space
                progress: _progress, // provide the progress in a range from 0.0 to 1.0
                isAnimation: false, // default: false, animate the progress of the bar
                solidBarColor: Colors.amber, // default: blue, main bar color
                emptyBarColor: Colors.orange.withOpacity(0.2), // default: gray, empty bar color
                strokeWidth: 20, // default: 15, bar width
                barStrokeCap: StrokeCap.round, // default: StrokeCap.round, bar cap shape
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
              )
```

## License

MIT
**Free Software, Hell Yeah!**