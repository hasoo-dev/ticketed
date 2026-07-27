import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/features/splash/widgtes/brading.dart';
import 'package:ticketed/features/splash/widgtes/splash_body.dart';
import 'package:ticketed/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    if (mounted) {
      splashServices.navigateToMain(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Brading(),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(child: Center(child: SplashBody())),
    );
  }
}
