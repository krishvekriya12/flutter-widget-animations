# Flutter Widget Animations

A day-by-day Flutter animation learning project. Each day contains a focused
animation example that can be run and studied independently.

## Contents

- [Animation showcase](#-animation-showcase)
- [Project overview](#project-overview)
- [Getting started](#getting-started)
- [Learning series](#learning-series)
- [Project structure](#project-structure)
- [Adding a new day](#adding-a-new-day)
- [Useful resources](#useful-resources)

## ✨ Animation Showcase

| ⚡ Day 01: Energy Core | 🚀 Day 02: Onboarding Screen |
| :---: | :---: |
| <a href="assets/videos/day_01.mp4"><img src="assets/demos/day_01.gif" width="280" alt="Day 01 Energy Core Demo" /></a> | <a href="assets/videos/day_02.mp4"><img src="assets/demos/day_02.gif" width="280" alt="Day 02 Onboarding Screen Demo" /></a> |
| *Pulse & glow animation using AnimatedContainer* | *Multi-step onboarding with smooth morphing transitions* |
| [📁 Source Code](lib/day_01_Animated_Container/) &bull; [🎬 Full Video](assets/videos/day_01.mp4) | [📁 Source Code](lib/day_02_Onboarding%20Screen/) &bull; [🎬 Full Video](assets/videos/day_02.mp4) |

> 💡 **Tip:** Click on any animated phone preview above to view or download the full resolution `.mp4` video.

## Project overview

| Day | Topic | Source code | Video Demo | Live Preview |
| :--- | :--- | :--- | :--- | :--- |
| Day 01 | Animated Container - Energy Core | [`day_01_Animated_Container`](lib/day_01_Animated_Container/) | [🎬 Video (.mp4)](assets/videos/day_01.mp4) | [✨ View GIF](assets/demos/day_01.gif) |
| Day 02 | Onboarding Screen | [`day_02_Onboarding Screen`](lib/day_02_Onboarding%20Screen/) | [🎬 Video (.mp4)](assets/videos/day_02.mp4) | [✨ View GIF](assets/demos/day_02.gif) |

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

<a href="assets/videos/day_01.mp4"><img src="assets/demos/day_01.gif" width="260" alt="Day 1 Animated Container Demo" /></a>

- Source: [`lib/day_01_Animated_Container/`](lib/day_01_Animated_Container/)
- Video: [`assets/videos/day_01.mp4`](assets/videos/day_01.mp4)

### Day 2 - Onboarding Screen

**Focus:** Creating an animated onboarding experience with reusable widgets,
page transitions, indicators, and a morphing background.

<a href="assets/videos/day_02.mp4"><img src="assets/demos/day_02.gif" width="260" alt="Day 2 Onboarding Screen Demo" /></a>

- Source: [`lib/day_02_Onboarding Screen/`](lib/day_02_Onboarding%20Screen/)
- Video: [`assets/videos/day_02.mp4`](assets/videos/day_02.mp4)

## Project structure

```text
flutter-widget-animations/
├── assets/
│   ├── demos/                  # Animated GIFs displayed directly in README
│   │   ├── day_01.gif
│   │   └── day_02.gif
│   └── videos/                 # Original MP4 screen recordings
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
└── scripts/
    └── generate_demo.ps1       # Automated script to create demo GIF from MP4
```

Each new day should have its own `day_NN_Topic_Name` folder under `lib/`, and its demo video stored in `assets/videos/day_NN.mp4`. Keep screen-level files in `screens/` and reusable UI pieces in `widgets/` when the example is large enough to benefit from that organization.

## Adding a new day

Follow these simple steps whenever you create a new animation example:

1. **Create code folder**: Add a new folder such as `lib/day_03_Animated_List/`.
2. **Add screens & widgets**: Build your screen and supporting widgets.
3. **Update runner**: Set the new screen as `home` in [`lib/main.dart`](lib/main.dart) to run it.
4. **Save screen recording video**:
   - Place your `.mp4` video in [`assets/videos/`](assets/videos/) as `day_03.mp4`.
5. **Generate GIF automatically**:
   - Run the included PowerShell script:
     ```powershell
     .\scripts\generate_demo.ps1 03
     ```
   - This automatically creates `assets/demos/day_03.gif` with web-optimized compression.
6. **Update Animation Showcase**:
   - Add a new column to the [Animation Showcase](#-animation-showcase) table:
     ```markdown
     | 🎨 Day 03: Topic Name |
     | :---: |
     | <a href="assets/videos/day_03.mp4"><img src="assets/demos/day_03.gif" width="280" alt="Day 03 Demo" /></a> |
     | *Brief description of the animation effect* |
     | [📁 Source Code](lib/day_03_<Topic>/) &bull; [🎬 Full Video](assets/videos/day_03.mp4) |
     ```
7. **Update Overview & Learning Series**:
   - Add a row to [project overview](#project-overview) table.
   - Add a matching section under [learning series](#learning-series).

## Useful resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter animation overview](https://docs.flutter.dev/ui/animations)
- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)
