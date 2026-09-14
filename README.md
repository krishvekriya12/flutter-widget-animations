# 📱 Flutter Widget Animations

A curated daily collection of modern, smooth, and interactive Flutter UI animations.

---

### ✨ Animation Showcase

| ⚡ Day 01: Energy Core | 🚀 Day 02: Onboarding Flow | ⏳ Day 03: Coming Soon |
| :---: | :---: | :---: |
| <a href="assets/videos/day_01.mp4"><img src="assets/demos/day_01.gif" width="250" alt="Day 01 Energy Core Demo" /></a> | <a href="assets/videos/day_02.mp4"><img src="assets/demos/day_02.gif" width="250" alt="Day 02 Onboarding Screen Demo" /></a> | <img src="assets/demos/placeholder.svg" width="250" alt="Day 03 Coming Soon" /> |
| *Pulse & glow effect with `AnimatedContainer`* | *Smooth morphing onboarding screen* | *Next animation challenge in progress* |
| [📁 Source Code](lib/day_01_Animated_Container/) &bull; [🎬 MP4 Video](assets/videos/day_01.mp4) | [📁 Source Code](lib/day_02_Onboarding%20Screen/) &bull; [🎬 MP4 Video](assets/videos/day_02.mp4) | *Stay tuned* |

> 💡 *Click on any phone preview to open the full-resolution `.mp4` video.*

---

### 🚀 Quick Start

```bash
# 1. Get dependencies
flutter pub get

# 2. Run app
flutter run
```

> 📌 **Note:** Change the imported screen in [`lib/main.dart`](lib/main.dart) to switch between different day animations.

---

### ➕ Adding a New Day

1. **Create Code Folder**: Build your widget under `lib/day_XX_<TopicName>/` and link it in [`lib/main.dart`](lib/main.dart).
2. **Save Video**: Put your recording at `assets/videos/day_XX.mp4`.
3. **Generate Demo GIF**: Run the 1-click script in PowerShell:
   ```powershell
   .\scripts\generate_demo.ps1 XX
   ```
4. **Update Showcase Grid**: Add the new demo into the 3-column grid in this README.

---

### 📂 Structure

```text
flutter-widget-animations/
├── assets/
│   ├── demos/            # Optimized GIFs displayed in README
│   └── videos/           # Original MP4 recordings
├── lib/
│   ├── main.dart         # Entry point (select active day here)
│   ├── day_01_Animated_Container/
│   └── day_02_Onboarding Screen/
└── scripts/
    └── generate_demo.ps1 # 1-click MP4 to GIF converter
```
