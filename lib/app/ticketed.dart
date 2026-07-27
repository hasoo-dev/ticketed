import 'package:flutter/material.dart';
import '../core/routes/routes_io.dart';
import '../core/theme/tick_theme.dart';

class Ticketed extends StatelessWidget {
  const Ticketed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ticketed",
      theme: TickTheme.lightTheme(),
      darkTheme: TickTheme.darkTheme(),
      themeMode: ThemeMode.light,
      routerConfig: RoutesIo.router,
     
    );
  }
}
