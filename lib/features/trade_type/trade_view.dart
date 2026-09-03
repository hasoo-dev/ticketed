import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/context_extension.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../auth/widgets/brand_title.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int selectedIndex = 0;

  final trades = [
    {
      "title": "Electrician",
      "subtitle": "WIRING • PANELS • LIGHTING",
      "icon": Icons.electric_bolt,
      "color": const Color(0xffD97706),
    },
    {
      "title": "Plumber",
      "subtitle": "PIPING • FIXTURES • DRAINAGE",
      "icon": Icons.plumbing,
      "color": const Color(0xff2563EB),
    },
    {
      "title": "HVAC",
      "subtitle": "COOLING • HEATING • VENTING",
      "icon": Icons.hvac,
      "color": const Color(0xff7C3AED),
    },
    {
      "title": "General Contractor",
      "subtitle": "RENOVATION • PROJECT MGMT",
      "icon": Icons.handyman,
      "color": const Color(0xff795900),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitle(
                width: context.width * 0.34,
                title: "What's your trade?",
                subTitle: "Select your primary specialization to customize your estimating workspace.",
              ),
              24.vSpace,
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
                  return _buildSelectTrade(
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
              32.vSpace,
              AppButton(
                onPressed: () {
                  context.go(RoutesName.main);
                },
                text: "GET STARTED 🚀",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectTrade({
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
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.darkBorder : Colors.grey.shade300,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.darkBorder.withValues(alpha: 0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 36),
            10.vSpace,
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            4.vSpace,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
