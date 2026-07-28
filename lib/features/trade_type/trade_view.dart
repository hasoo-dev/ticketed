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
import '../home/widgets/lead_model.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  int selectedIndex = -1;
   final List<LeadModel> leads = [
    LeadModel(
      initials: "JD",
      name: "John Doe",
      service: "Kitchen Remodel",
      status: "SENT",
      price: "\$4,200",
      statusColor: Colors.amber,
      stripColor: Colors.amber,
      avatarColor: const Color(0xffE6E8F8),
    ),
    LeadModel(
      initials: "AS",
      name: "Alice Smith",
      service: "Exterior Painting",
      status: "VIEWED",
      price: "\$1,850",
      statusColor: Colors.grey.shade300,
      stripColor: Colors.grey.shade300,
      avatarColor: const Color(0xffEEEEEE),
    ),
    LeadModel(
      initials: "RT",
      name: "Robert Taylor",
      service: "Roof Repair",
      status: "ACCEPTED",
      price: "\$12,400",
      statusColor: Colors.green.shade200,
      stripColor: Colors.green,
      avatarColor: const Color(0xff8FE3A9),
    ),
    LeadModel(
      initials: "MM",
      name: "Modern Mechanics",
      service: "HVAC Maintenance",
      status: "SENT",
      price: "\$850",
      statusColor: Colors.amber,
      stripColor: Colors.amber,
      avatarColor: const Color(0xffE6E8F8),
    ),
  ];
  final trades = [
    {
      "title": "Electrician",
      "subtitle": "WIRING • PANELS • LIGHTING",
      "icon": Icons.electric_bolt,
      "color": Colors.amber,
    },
    {
      "title": "Plumber",
      "subtitle": "PIPING • FIXTURES • DRAINAGE",
      "icon": Icons.plumbing,
      "color": Colors.blue,
    },
    {
      "title": "HVAC",
      "subtitle": "COOLING • HEATING • VENTING",
      "icon": Icons.hvac,
      "color": Colors.purple,
    },
    {
      "title": "General Contractor",
      "subtitle": "RENOVATION • PROJECT MGMT",
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
                subTitle:
                    "Select your primary specialization to customize your estimating workspace.",
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
                  context.go(RoutesName.main);
                },
                text: "GET STARTED",
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
            Flexible(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget buidlQoutesContainer({
    required String title,
    required String subtitle,
    required IconData icon,
    required String branding,
    required Color iconColor,
  }) {
    return Container(
      height: context.height * 0.2,
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(width: 1.2, color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Spacer(),
          Text(
            title,
            style: context.text.headlineSmall!.copyWith(
              color: Colors.brown.shade600,
              letterSpacing: 2.0,
            ),
          ),
          12.vSpace,
          Text(subtitle.toString(), style: context.text.displayLarge),
          Spacer(),
          Row(
            spacing: 5,
            children: [
              Icon(icon, color: iconColor),
              Text(
                branding,
                style: context.text.bodyLarge!.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
