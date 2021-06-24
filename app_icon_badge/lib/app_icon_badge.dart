import 'dart:async';

import 'package:flutter/services.dart';

class AppIconBadge {
  static const MethodChannel _channel = const MethodChannel('app_icon_badge');

  static Future<int> get count async {
    final int badgeCount = await _channel.invokeMethod('getBadgeCount');
    return badgeCount;
  }
}
