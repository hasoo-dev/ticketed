import 'package:flutter/material.dart';
import 'package:ticketed/core/constant/app_button.dart';
import 'package:ticketed/core/constant/app_fonts.dart';
import 'package:ticketed/core/extensions/context_extension.dart';
import 'package:ticketed/core/extensions/int_extension.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/features/auth/widgets/app_textfield.dart';

import '../../core/theme/app_colors.dart';
import 'widgets/lead_card.dart';
import 'widgets/lead_model.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  final clientsCard = [
    {"title": "Active Clients", "number": "134", "color": Colors.brown},
    {"title": "Avg. Qoute Vol.", "number": "\$4.2k", "color": Colors.brown},
    {"title": "Retenstion Rate", "number": "92%", "color": Colors.green},
    {"title": "total Qoutes", "number": "842", "color": Colors.brown},
  ];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text("My Clients", style: context.text.displaySmall),
              Text(
                "Manage your professional network and historical job data. Search by name, project, or location.",
                style: context.text.labelLarge!.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              23.vSpace,
              AppButton(
                text: "👨🏻‍💼 ADD NEW CLIENT",

                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
              ),
              23.vSpace,
              AppTextField(
                prefixIcon: Icon(Icons.search),
                hintText: "Serach Clients...",
              ),
              23.vSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: clientsCard.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  final clients = clientsCard[index];
                  return buildClientsCard(
                    title: clients["title"] as String,
                    number: clients["number"] as String,
                    numberColor: clients["color"] as Color,
                  );
                },
              ),
              23.vSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: leads.length,
                itemBuilder: (context, index) {
                  return LeadCard(lead: leads[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClientsCard({
    required String title,
    required String number,
    required Color numberColor,
  }) {
    return Container(
      height: context.height * 0.12,
      width: context.width * 0.27,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(width: 1.2, color: Colors.orange.shade100),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Spacer(),
          Text(
            title,
            style: context.text.bodyLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(flex: 2),
          Text(
            number,
            style: context.text.bodyLarge!.copyWith(
              color: numberColor,
              fontWeight: FontWeight.w800,
              fontSize: AppFonts.f20,
            ),
          ),
          Spacer(),
        ],
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
