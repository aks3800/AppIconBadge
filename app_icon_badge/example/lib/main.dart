import 'package:app_icon_badge/app_icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Badge Icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Badge Count Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('method_channel.flutter.dev/appIconBadge');

  // Get badge count
  String _badgeCount = 'Unknown badge count';

  Future<void> _getBadgeCount() async {
    String badgeCount;
    try {
      final int result = await AppIconBadge.count;
      badgeCount = 'Badge count: $result';
    } on PlatformException catch (e) {
      badgeCount = "Failed to get badge count: '${e.message}'.";
    }

    setState(() {
      _badgeCount = badgeCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Badge Count'),
              onPressed: _getBadgeCount,
            ),
            Text(_badgeCount),
          ],
        ),
      ), //
    );
  }
}
