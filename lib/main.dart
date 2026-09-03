// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ticketed/app/ticketed.dart';
import 'package:ticketed/core/utils/app_logger.dart';
import 'package:ticketed/services/session_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.i('🚀 Starting Ticketed application...');
  await SessionService.instance.restoreSession();

  // runApp(
  //   DevicePreview(enabled: !kReleaseMode, builder: (context) => const Ticketed()),
  // );
  runApp(Ticketed());
}
