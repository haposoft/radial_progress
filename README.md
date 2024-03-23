
<img alt="Flutter" src="https://img.shields.io/badge/Flutter-075898?style=flat-squar&logo=flutter&logoColor=white"/>

<p align="center">
  <img src="https://github.com/shervin-h/radial_progress/blob/main/assets/demo.gif?raw=true" height="400">
</p>

# Radial Progress

[![pub package](https://img.shields.io/pub/v/radial_progress.svg)](https://pub.dev/packages/radial_progress)

Use `radial_progress` package to display pie charts with dynamic progress percentage by enabling animation

### Where is it used?

- In applications that display currency and gold rates to the user
- In sports applications that calculate the length of a period of time
- In applications that provide diet to the user
- In educational applications in order to display the student's academic progress
- In store applications in the shopping cart section
- ...

📈 📉 🎛 📱

## Install Package

Add the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  radial_progress: ^0.1.0
```

Then run:

```
flutter pub get
```

## Usage

Import it

```dart
import 'package:radial_progress/radial_progress.dart';
```

Now in your flutter code, you can use:

- The `percent` should be between 0.0 and 1.0.
- If you don't specify the `diameter`, it defaults to 80.
- By default, the `progressLineWidth` is 10. You can change it, but the maximum limit is up to one third of the diameter.
- Animation is enabled by default. You can set a duration for it or disable it.
- Feature `progressLineColors` is nullable. For the color of the progress line,
you can consider a list of colors. Depending on the `percent` feature, this line can take one of the colors from the list.
If the progress rate is 0%, the color in zeroth index will be taken,
and if the progress percentage is 100%, the color of the last index will be taken.
- The `startAngle` attribute specifies the starting point or the angle of drawing the progress line. That is a enum.

<br>

<p align="center">
    <img alt="screenshot1" src="https://github.com/shervin-h/radial_progress/blob/main/assets/screenshot1.png?raw=true" height="400">
</p>

```dart
RadialProgressWidget(
  percent: 0.35,
  diameter: 180,
  bgLineColor: Colors.cyan.withOpacity(0.2),
  progressLineWidth: 16,
  startAngle: StartAngle.top,
  centerChild: const Text(
    '\$ 547.52 - \$ 800.0',
    maxLines: 1,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
```

<br>

<p align="center">
    <img alt="screenshot2" src="https://github.com/shervin-h/radial_progress/blob/main/assets/screenshot2.png?raw=true" height="400">
</p>

```dart
RadialProgressWidget(
  percent: 0.7,
  diameter: 180,
  bgLineColor: Colors.grey.withOpacity(0.2),
  progressLineWidth: 24,
  startAngle: StartAngle.top,
  progressLineColors: const [
    Colors.green,
  ],
  centerChild: const Text(
    '70 %',
    maxLines: 1,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
  ),
);
```

### by Shervin Hassanzadeh

Contact me at
<br>

  <a href="https://www.linkedin.com/in/shervin-hassanzadeh/">
    <img alt="linkedin" src="https://img.shields.io/badge/linkedin-0077B5.svg?style=flat-squar&logo=linkedin&logoColor=white"/>
  </a>
  <a href="mailto:shervin.hz07@gmail.com">
    <img alt="Email" src="https://img.shields.io/badge/Email-D14836?style=flat-squar&logo=gmail&logoColor=white"/>
  </a>
  <a href="https://t.me/shervin_hz07">
    <img alt="telegram" src="https://img.shields.io/badge/Telegram-2B9FD1?style=flat-squar&logo=telegram&logoColor=white" />
  </a>
  <a href="https://github.com/shervin-h">
    <img alt="github" src="https://img.shields.io/badge/github-121011.svg?style=flat-squar&logo=github&logoColor=white"/>
  </a>
  <a href="https://stackoverflow.com/users/13066224/shervin">
    <img alt="stackoverflow" src="https://img.shields.io/badge/Stackoverflow-ef8236?style=flat-squar&logo=stackoverflow&logoColor=white" />
  </a>

<br>
