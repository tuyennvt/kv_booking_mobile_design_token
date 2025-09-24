# KV Booking Mobile Design Token

Package Flutter cung cấp hệ thống design token, bao gồm các thành phần thiết kế như màu sắc, typography, spacing, và breakpoints.

## 📋 Mục lục

- [Cài đặt](#cài-đặt)
- [Sử dụng](#sử-dụng)
- [API Reference](#api-reference)
- [Ví dụ](#ví-dụ)

## 🚀 Cài đặt

Thêm package này vào file `pubspec.yaml` của bạn:

```yaml
dependencies:
  kv_booking_mobile_design_token: ^1.0.0
```

Sau đó chạy:

```bash
flutter pub get
```

### Yêu cầu hệ thống

- Flutter SDK: >=3.24.3
- Dart SDK: ^3.5.3

## 💻 Sử dụng

### Import Package

```dart
import 'package:kv_booking_mobile_design_token/kv_booking_mobile_design_token.dart';
```

### Sử dụng Design Token mặc định

```dart
// Sử dụng design token với cấu hình mặc định
final padding = designToken.globalPaddingM1;
final primaryColor = designToken.productStyleTypePrimaryCorlor500;
final fontSize = designToken.headlineMSize;
```

### Cấu hình Design Token tùy chỉnh

```dart
// Cấu hình design token với các tham số tùy chỉnh
configDesignToken(
  isKeivi: true,                    // Sử dụng theme Keivi
  fontSizeType: FontSizeType.mobile, // Loại font size
  dimensionType: DimensionMobileType.medium, // Loại dimension
  breakpointType: BreakpointType.medium,     // Loại breakpoint
);

// Sau khi cấu hình, sử dụng designToken như bình thường
final customPadding = designToken.globalPaddingL1;
```

## 📚 API Reference

### BreakpointType

```dart
enum BreakpointType {
  small,   // Màn hình nhỏ
  medium,  // Màn hình trung bình
}
```

### DimensionMobileType

```dart
enum DimensionMobileType {
  small,   // Kích thước nhỏ
  medium,  // Kích thước trung bình
}
```

### FontSizeType

```dart
enum FontSizeType {
  mobile,  // Font size cho mobile
  desktop, // Font size cho desktop
}
```

## 🎯 Ví dụ

### Sử dụng trong Widget

```dart
import 'package:flutter/material.dart';
import 'package:kv_booking_mobile_design_token/kv_booking_mobile_design_token.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(designToken.globalPaddingM1),
      margin: EdgeInsets.symmetric(
        horizontal: designToken.globalMarginM2,
        vertical: designToken.globalMarginM1,
      ),
      decoration: BoxDecoration(
        color: designToken.productStyleTypePrimaryCorlor500,
        borderRadius: BorderRadius.circular(designToken.globalSizeM1),
      ),
      child: Text(
        'Hello World',
        style: TextStyle(
          fontSize: designToken.headlineMSize,
          fontWeight: FontWeight.w600,
          color: designToken.productStyleTypeBackgroundLight,
        ),
      ),
    );
  }
}
```

### Cấu hình Theme cho ứng dụng

```dart
import 'package:flutter/material.dart';
import 'package:kv_booking_mobile_design_token/kv_booking_mobile_design_token.dart';

void main() {
  // Cấu hình design token trước khi khởi tạo app
  configDesignToken(
    isKeivi: false,
    fontSizeType: FontSizeType.mobile,
    dimensionType: DimensionMobileType.medium,
    breakpointType: BreakpointType.medium,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primaryColor: designToken.productStyleTypePrimaryCorlor500,
        scaffoldBackgroundColor: designToken.productStyleTypeBackgroundLight,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: designToken.headlineLSize,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: designToken.bodyLSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
```