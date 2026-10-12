
## 1.0.3

* Update sdk android 3.6.11

## 1.0.4

*Update model ai lite
*Fix bug crash on android

## 1.0.5

* Update sdk android 3.6.12

## 1.0.6

* Update sdk android 3.6.13
* Fix expire -> expired

## 1.0.7

* Bổ sung màn hình hướng dẫn quét mã QR cho luồng tách quét QR (không áp dụng cho luồng xác thực giấy tờ gắn chip)

## 1.0.8

* Fix crash android

## 1.0.9

* Fix timeout qr code ios

## 1.0.10

* Update SDK android version to 1.8.6
* Vá lỗi bảo mật
- build.gradle(.kts) module app
 ```gradle
 android {
    ...

    packaging {
        resources.excludes += '/META-INF/versions/9/OSGI-INF/MANIFEST.MF'
    }
 }
 ```
 - gradle.properties module app
 ```
 android.jetifier.ignorelist=bcprov-jdk18on
 ```

## 1.0.11

* Downgrade version bouncycastle to 1.78

## 1.0.12

* Lower iOS deployment target to 12.0
* Set Flutter SDK version to 3.29.3

## 1.0.13

* Bổ sung cấu hình `isTurnOffCallService` cho dịch vụ eKYC và màn hình cài đặt.
* Tích hợp hỗ trợ Watermark và cập nhật phiên bản SDK Android mới (`ekyc_sdk_lite-release-v3.7.2.aar` và `scanqr_ic_sdk-release-v1.0.6.aar`).

## 1.0.14

* Cập nhật SDK Android eKYC Lite lên phiên bản 3.7.4 (`ekyc_sdk_lite-release-v3.7.4.aar`).

## 1.0.15

* Bổ sung root `ICEKYCLite.podspec` hỗ trợ ứng dụng iOS Native tích hợp module Flutter qua CocoaPods (`ICSdkEKYC.xcframework`, `eKYCLite.xcframework`).
* Nâng cấp script `release.sh` tự động đồng bộ version vào `ICEKYCLite.podspec` và `pubspec.yaml`.

## 1.0.16

* Bổ sung cấu hình chất lượng ảnh `compressionQualityImageIos` (iOS: 0.0 - 1.0) và `cameraQualityImageAndroid` (Android: 40 - 100) trên `ICEkycConfig` và `ICEkycPresets`.
* Chuẩn hóa toàn bộ DartDoc comments theo tiêu chuẩn Effective Dart cho `ICEkycConfig` và `ICEkycPresets`.
* Hiển thị dung lượng ảnh chụp (KB) trên màn hình kết quả của ứng dụng mẫu (`example`) để kiểm tra nén ảnh trên cả Android và iOS.
* Cập nhật màn hình cài đặt trong `example` cho phép tùy chỉnh cấu hình nén ảnh.