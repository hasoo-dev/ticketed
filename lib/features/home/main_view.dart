import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/routes_name.dart';
import '../clients/clients_view.dart';
import '../quotes/quotes_view.dart';
import '../templates/template_view.dart';
import 'home_view.dart';
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
    SizedBox(), // Placeholder for center FAB
    TempleteView(),
    ClientsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex == 2 ? 0 : currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Trigger New Quote Flow
            context.push(RoutesName.newQuote);
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
