import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_icon_badge/app_icon_badge.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_icon_badge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AppIconBadge.platformVersion, '42');
  });
}
