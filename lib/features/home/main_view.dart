import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import '../view.dart';
import 'widgets/botttom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final pages = const [
    HomeView(),
    QoutesView(),
    SizedBox(),
    TempleteView(),
    ClientsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Navigate to New Quote
            return;
          }

          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
