# Square progress bar because why not 😎

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Features

- Dynamic sizing
- Animated progress bar
- Gradient color bar support
- ✨Magic✨

![alt text](img/DXProgressBar.gif)

## Installation
```sh
dependencies:
  square_progress_bar: ^1.0.1
```
## Getting started
Just provide the progress percentage in a range from 0.0 to 1.0 and you are set to go.

## Usage
```dart
          SizedBox(
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
          )
```

## License

MIT
**Free Software, Hell Yeah!**