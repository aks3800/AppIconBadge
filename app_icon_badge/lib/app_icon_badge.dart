
import 'dart:async';

import 'package:flutter/services.dart';

class AppIconBadge {
  static const MethodChannel _channel =
      const MethodChannel('app_icon_badge');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}