# Flutter Widget Animations

A day-by-day Flutter animation learning project. Each day contains a focused
animation example that can be run and studied independently.

## Contents

- [Project overview](#project-overview)
- [Getting started](#getting-started)
- [Learning series](#learning-series)
- [Project structure](#project-structure)
- [Adding a new day](#adding-a-new-day)
- [Useful resources](#useful-resources)

## Project overview

| Day | Topic | Source code | Video |
| --- | --- | --- | --- |
| Day 1 | Animated Container - Energy Core | [`day_01_Animated_Container`](lib/day_01_Animated_Container/) | [Open day 1 video](file:///F:/yt%20video/day1.mp4) |
| Day 2 | Onboarding Screen | [`day_02_Onboarding%20Screen`](lib/day_02_Onboarding%20Screen/) | [Open day 2 video](file:///F:/yt%20video/day02.mp4) |

> The video links point to the local `F:\yt video` folder on Windows. They are
> intended for local development and will only work on a computer that has the
> same files at that location. For shareable links, replace them with YouTube
> or another hosted video URL.

## Getting started

### Requirements

- Flutter SDK 3.44.7 or compatible
- Dart SDK 3.12.2 or compatible

### Run the project

```bash
flutter pub get
flutter run
```

The active example is selected in [`lib/main.dart`](lib/main.dart). Change the
import and root widget there when switching between day projects.

## Learning series

### Day 1 - Animated Container

**Focus:** Building a polished animated energy core using Flutter's
`AnimatedContainer` and related visual effects.

- Source: [`lib/day_01_Animated_Container/`](lib/day_01_Animated_Container/)
- Video: [Open day 1 video](file:///F:/yt%20video/day1.mp4)

### Day 2 - Onboarding Screen

**Focus:** Creating an animated onboarding experience with reusable widgets,
page transitions, indicators, and a morphing background.

- Source: [`lib/day_02_Onboarding%20Screen/`](lib/day_02_Onboarding%20Screen/)
- Video: [Open day 2 video](file:///F:/yt%20video/day02.mp4)

## Project structure

```text
lib/
├── main.dart
├── day_01_Animated_Container/
│   └── energy_core_screen.dart
└── day_02_Onboarding Screen/
    ├── models/
    ├── screens/
    └── widgets/
```

Each new day should have its own `day_NN_Topic_Name` folder. Keep screen-level
files in `screens/` and reusable UI pieces in `widgets/` when the example is
large enough to benefit from that organization.

## Adding a new day

1. Create a folder such as `lib/day_03_Animated_List/`.
2. Add the new screen and supporting widgets.
3. Update [`lib/main.dart`](lib/main.dart) to run the new example.
4. Add one row to the [project overview](#project-overview).
5. Add a matching section under [learning series](#learning-series).
6. Add the local video link using this format:

   ```markdown
   | Day 3 | Animated List | [`day_03_Animated_List`](lib/day_03_Animated_List/) | [Open day 3 video](file:///F:/yt%20video/day03.mp4) |
   ```

7. If the video is hosted online, replace the local `file:///` link with the
   public URL so everyone can access it.

## Useful resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter animation overview](https://docs.flutter.dev/ui/animations)
- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

