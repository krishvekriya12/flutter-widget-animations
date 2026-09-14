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

| Day | Topic | Source code | Video Demo |
| :--- | :--- | :--- | :--- |
| Day 01 | Animated Container - Energy Core | [`day_01_Animated_Container`](lib/day_01_Animated_Container/) | [🎬 Watch Day 01](assets/videos/day_01.mp4) |
| Day 02 | Onboarding Screen | [`day_02_Onboarding Screen`](lib/day_02_Onboarding%20Screen/) | [🎬 Watch Day 02](assets/videos/day_02.mp4) |

> 💡 **Tip:** Video demos are stored inside the repository at [`assets/videos/`](assets/videos/). When viewing on GitHub or locally, click any video link to open and play the demo.

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
- Video: [🎬 Watch Day 01 Demo](assets/videos/day_01.mp4)

### Day 2 - Onboarding Screen

**Focus:** Creating an animated onboarding experience with reusable widgets,
page transitions, indicators, and a morphing background.

- Source: [`lib/day_02_Onboarding Screen/`](lib/day_02_Onboarding%20Screen/)
- Video: [🎬 Watch Day 02 Demo](assets/videos/day_02.mp4)

## Project structure

```text
flutter-widget-animations/
├── assets/
│   └── videos/
│       ├── day_01.mp4
│       └── day_02.mp4
├── lib/
│   ├── main.dart
│   ├── day_01_Animated_Container/
│   │   └── energy_core_screen.dart
│   └── day_02_Onboarding Screen/
│       ├── models/
│       ├── screens/
│       └── widgets/
```

Each new day should have its own `day_NN_Topic_Name` folder under `lib/`, and its demo video stored in `assets/videos/day_NN.mp4`. Keep screen-level files in `screens/` and reusable UI pieces in `widgets/` when the example is large enough to benefit from that organization.

## Adding a new day

Follow these steps whenever you create a new animation example:

1. **Create code folder**: Add a new folder such as `lib/day_03_Animated_List/`.
2. **Add screens & widgets**: Build your screen and supporting widgets.
3. **Update runner**: Set the new screen as `home` in [`lib/main.dart`](lib/main.dart) to run it.
4. **Add demo video**:
   - Save your demo recording in [`assets/videos/`](assets/videos/).
   - Follow standard naming: `day_03.mp4` (or `day_XX.mp4`).
5. **Update README table**: Add a new row to the [project overview](#project-overview) table:
   ```markdown
   | Day 03 | Animated List | [`day_03_Animated_List`](lib/day_03_Animated_List/) | [🎬 Watch Day 03](assets/videos/day_03.mp4) |
   ```
6. **Update Learning Series**: Add a matching section under [learning series](#learning-series):
   ```markdown
   ### Day 3 - Animated List

   **Focus:** Description of what was built and learned.

   - Source: [`lib/day_03_Animated_List/`](lib/day_03_Animated_List/)
   - Video: [🎬 Watch Day 03 Demo](assets/videos/day_03.mp4)
   ```

## Useful resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter animation overview](https://docs.flutter.dev/ui/animations)
- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

