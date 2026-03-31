
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