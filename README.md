# VNPT eKYC Lite Flutter Plugin

A Flutter plugin for VNPT eKYC Lite SDK.

## Getting Started

### 1. Installation

Add `flutter_plugin_ic_ekyc_lite` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  flutter_plugin_ic_ekyc_lite:
    git:
      url: https://github.com/MobileTeamIC/flutter_plugin_ic_ekyc_lite.git
      ref: v1.0.0
```

### 2. Android Setup

#### Copy SDK Libraries
You need to manually copy the SDK library files from the plugin's example directory to your own project:
1.  Open `/example/android/app/libs/` in the plugin folder.
2.  Copy all `.aar` files:
    *   `ekyc_sdk_lite-release-v3.6.12.aar`
    *   `scanqr_ic_sdk-release-v1.0.6.aar`
3.  Paste them into your project's `android/app/libs/` directory.

#### Update Build Configuration
In your project's `android/app/build.gradle` (or `build.gradle.kts`), add the following to your dependencies:

```gradle
dependencies {
    implementation(files("libs/ekyc_sdk_lite-release-v3.6.12.aar"))
    implementation(files("libs/scanqr_ic_sdk-release-v1.0.6.aar"))
}
```

### 3. iOS Setup

#### Update Info.plist
Add the following permissions to your `ios/Runner/Info.plist` to allow the SDK to use the camera and microphone:

```xml
<key>NSCameraUsageDescription</key>
<string>We need access to your camera for face matching and document scanning.</string>
<key>NSMicrophoneUsageDescription</key>
<string>We need access to your microphone for video recording during the eKYC process.</string>
```

#### Pod Install
Run the following command in your project's `ios` directory:
```bash
pod install
```


## Usage

Import the package:

```dart
import 'package:flutter_plugin_ic_ekyc_lite/flutter_plugin_ic_ekyc_lite.dart';
```

Refer to the `example` directory for a complete implementation guide.

