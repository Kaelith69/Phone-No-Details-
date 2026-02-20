<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 220" width="900" height="220">
  <defs>
    <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0d1117;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#161b22;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="teal" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#00b4d8;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#009688;stop-opacity:1" />
    </linearGradient>
    <filter id="glow">
      <feGaussianBlur stdDeviation="3" result="coloredBlur"/>
      <feMerge><feMergeNode in="coloredBlur"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
  </defs>
  <!-- Background -->
  <rect width="900" height="220" fill="url(#bg)" rx="16"/>
  <!-- Decorative circles -->
  <circle cx="820" cy="40" r="80" fill="#009688" opacity="0.07"/>
  <circle cx="80"  cy="180" r="60" fill="#00b4d8" opacity="0.07"/>
  <!-- Phone icon -->
  <g transform="translate(60,60)" filter="url(#glow)">
    <rect x="0" y="0" width="50" height="80" rx="8" fill="none" stroke="url(#teal)" stroke-width="3"/>
    <rect x="8" y="10" width="34" height="50" rx="3" fill="#00b4d8" opacity="0.15"/>
    <circle cx="25" cy="70" r="4" fill="url(#teal)"/>
    <!-- Signal dots -->
    <circle cx="55" cy="18" r="3" fill="#009688" opacity="0.9"/>
    <circle cx="65" cy="12" r="3" fill="#009688" opacity="0.7"/>
    <circle cx="75" cy="6"  r="3" fill="#009688" opacity="0.5"/>
  </g>
  <!-- Title -->
  <text x="140" y="105" font-family="'Segoe UI', Arial, sans-serif" font-size="36"
        font-weight="700" fill="url(#teal)" filter="url(#glow)">Phone No. Details</text>
  <!-- Subtitle -->
  <text x="141" y="135" font-family="'Segoe UI', Arial, sans-serif" font-size="15"
        fill="#8b949e">Lookup carrier, validity &amp; location for any number — built with Flutter</text>
  <!-- Divider -->
  <line x1="140" y1="148" x2="760" y2="148" stroke="url(#teal)" stroke-width="1.5" opacity="0.4"/>
  <!-- Tags -->
  <g font-family="monospace" font-size="12" fill="#009688">
    <text x="142" y="170">🐦 Flutter</text>
    <text x="230" y="170">🎯 Dart 3</text>
    <text x="310" y="170">🌐 REST API</text>
    <text x="410" y="170">📱 Cross-platform</text>
    <text x="545" y="170">🔍 Real-time validation</text>
  </g>
</svg>

# Phone No. Details

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter\&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart\&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-teal.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](pubspec.yaml)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey)](https://flutter.dev/multi-platform)
[![API](https://img.shields.io/badge/API-APILayer-orange)](https://apilayer.com/marketplace/number_verification-api)

---

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Architecture](#architecture)
4. [Project Structure](#project-structure)
5. [Setup & Installation](#setup--installation)
6. [Usage](#usage)
7. [API Reference](#api-reference)
8. [Technologies Used](#technologies-used)
9. [License](#license)

---

## Overview

**Phone No. Details** is a Flutter application that validates any phone number and returns rich metadata: carrier name, line type, geographic location, country details, and a validity flag — all in a single tap.

It uses the [APILayer Number Verification API](https://apilayer.com/marketplace/number_verification-api) under the hood and is structured around clean-architecture principles so it stays easy to test and extend.

> 💡 **Tip:** Numbers must be in **E.164 international format** (e.g. `+14155552671`) for the best results.

---

## Features

| Feature | Description |
|---|---|
| ✅ **Validity Check** | Instantly tells you whether the number is a real, dialable number |
| 🌍 **Country Details** | Country name, country code, and geographic location |
| 📡 **Carrier Lookup** | Identifies the mobile or landline carrier |
| 🔗 **Format Normalisation** | Returns both local and E.164 international formats |
| 📱 **Line Type Detection** | Mobile, landline, VOIP, etc. |
| 🎨 **Clean Dark UI** | Modern dark-themed Material Design interface |
| 🔄 **Loading State** | Spinner while the request is in flight; button disabled to prevent double-taps |
| ⚠️ **Error Handling** | Network errors and empty input are caught and displayed gracefully |

---

## Architecture

The project follows a simple **layered architecture**:

```
Presentation  →  lib/screens/      (Flutter Widgets)
Business      →  lib/services/     (API calls, domain logic)
Data          →  lib/models/       (plain Dart data classes)
Config        →  lib/config/       (constants, keys)
```

*No state-management library is needed at this scale; plain `setState` keeps the dependency footprint minimal.*

---

## Project Structure

```
Phone-No-Details-/
├── lib/
│   ├── main.dart                      # App entry point (MyApp)
│   ├── config/
│   │   └── app_config.dart            # API key & base URL constants
│   ├── models/
│   │   └── phone_details.dart         # Typed response model
│   ├── screens/
│   │   └── phone_details_screen.dart  # Main UI screen
│   └── services/
│       └── phone_service.dart         # HTTP service (APILayer)
├── android/                           # Android platform shell
├── ios/                               # iOS platform shell
├── web/                               # Web platform shell
├── linux/                             # Linux platform shell
├── macos/                             # macOS platform shell
├── windows/                           # Windows platform shell
├── test/                              # Widget & unit tests
├── analysis_options.yaml              # Dart lint configuration
├── pubspec.yaml                       # Project manifest & dependencies
└── README.md
```

---

## Setup & Installation

### Prerequisites

| Tool | Minimum Version |
|---|---|
| Flutter SDK | 3.0.0 |
| Dart SDK | 3.0.0 |
| An emulator / physical device | Android 5+ / iOS 12+ |

### 1 — Clone the repository

```bash
git clone https://github.com/Kaelith69/Phone-No-Details-.git
cd Phone-No-Details-
```

### 2 — Install dependencies

```bash
flutter pub get
```

### 3 — Supply your API key

1. Sign up at <https://apilayer.com> and subscribe to the **Number Verification API**.
2. Open `lib/config/app_config.dart` and replace `YOUR_API_KEY_HERE` with your key.

```dart
static const String apiKey = 'YOUR_API_KEY_HERE'; // ← paste key here
```

> ⚠️ **Security:** Never commit a real API key to a public repository.  Consider loading it from a `.env` file (excluded via `.gitignore`) or a secrets manager.

### 4 — Run the app

```bash
# Default device
flutter run

# Specific target
flutter run -d chrome          # Web
flutter run -d windows         # Windows desktop
```

---

## Usage

```
1. Launch the app on your device or emulator.
2. Type a phone number in international format into the text field.
   Example: +14155552671
3. Tap "Get Details".
4. The card below will populate with all available metadata.
```

> 🎬 *Drop a screen-recording GIF of the running app here — first impressions matter!*

### Example response

| Field | Example value |
|---|---|
| Valid | Yes ✓ |
| Number | 14155552671 |
| Local Format | (415) 555-2671 |
| International Format | +14155552671 |
| Country Code | US |
| Country Name | United States |
| Location | California |
| Carrier | AT\&T |
| Line Type | mobile |

---

## API Reference

The app calls the **APILayer Number Verification API**:

```
GET https://api.apilayer.com/number_verification/validate?number={number}
Headers:
  apikey: <YOUR_KEY>
```

Full documentation: <https://apilayer.com/marketplace/number_verification-api>

---

## Technologies Used

| Technology | Purpose |
|---|---|
| [Flutter](https://flutter.dev) | Cross-platform UI framework |
| [Dart 3](https://dart.dev) | Programming language |
| [`http`](https://pub.dev/packages/http) | HTTP client for REST calls |
| [APILayer](https://apilayer.com) | Phone number validation API |
| [Material Design 3](https://m3.material.io) | UI component library |

---

## License

Distributed under the **MIT License**.  See [LICENSE](LICENSE) for details.

---

<p align="center">
  <sub>
    Made with ❤️ and Flutter &nbsp;|&nbsp;
    Why do programmers prefer dark mode? &nbsp;<em>Because light attracts bugs.</em> 🐛
  </sub>
</p>
