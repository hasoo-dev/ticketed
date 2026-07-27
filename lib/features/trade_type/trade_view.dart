import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/core/constant/app_button.dart';
import 'package:ticketed/core/extensions/context_extension.dart';
import 'package:ticketed/core/extensions/int_extension.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/core/routes/routes_name.dart';
import 'package:ticketed/features/auth/widgets/brand_title.dart';

import '../../core/theme/app_colors.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int selectedIndex = -1;
  final trades = [
    {
      "title": "Electrician",
      "subtitle": "Electrical Services",
      "icon": Icons.electric_bolt,
      "color": Colors.amber,
    },
    {
      "title": "Plumber",
      "subtitle": "Water & Pipes",
      "icon": Icons.plumbing,
      "color": Colors.blue,
    },
    {
      "title": "Painter",
      "subtitle": "Painting Works",
      "icon": Icons.format_paint,
      "color": Colors.purple,
    },
    {
      "title": "Carpenter",
      "subtitle": "Wood Works",
      "icon": Icons.handyman,
      "color": Colors.brown,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              BrandTitle(
                width: context.width * 0.34,
                title: "What's your trade?",
                subTitle: "We'll pre-load starter templates for you.",
              ),
              23.vSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trades.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final trade = trades[index];

                  return buildSelectTrade(
                    title: trade["title"] as String,
                    subtitle: trade["subtitle"] as String,
                    icon: trade["icon"] as IconData,
                    iconColor: trade["color"] as Color,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
              34.vSpace,
              AppButton(
                onPressed: () {
                  context.go(RoutesName.home);
                },
                text: "Continue",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectTrade({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white54 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.darkBorder : Colors.grey.shade300,
            width: isSelected ? 4 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 35),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
