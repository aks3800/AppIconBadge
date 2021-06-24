import 'package:app_icon_badge/app_icon_badge.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_icon_badge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 7;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getBadgeCount', () async {
    expect(await AppIconBadge.count, 7);
  });
}
