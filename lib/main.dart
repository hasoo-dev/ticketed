// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ticketed/app/ticketed.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp(
  //   DevicePreview(enabled: !kReleaseMode, builder: (context) => Ticketed()),
  // );
  runApp(Ticketed());
}
