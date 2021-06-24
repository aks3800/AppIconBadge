import Flutter
import UIKit

public class SwiftAppIconBadgePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_icon_badge", binaryMessenger: registrar.messenger())
        let instance = SwiftAppIconBadgePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getBadgeCount":
            result(UIApplication.shared.applicationIconBadgeNumber)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
