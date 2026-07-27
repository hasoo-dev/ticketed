import 'package:flutter/material.dart';
import 'package:ticketed/core/utils/helpers.dart';
 
import '../../../core/extensions/theme_extensions.dart';

class BrandIllustrations extends StatelessWidget {
  const BrandIllustrations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFDFD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Badge
          Image.asset("assets/icons/ic_ticketed.png", width: Helpers.screenWidth(context) * 0.26),
          const SizedBox(height: 32),
          Text(
            'Nexora',
            style: context.text.bodyMedium!.copyWith(
              color: const Color(0xFF0F172A),
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'The complete POS, billing, and ledger management solution for modern retail and wholesale businesses.',
            style: context.text.bodyMedium!.copyWith(
              color: const Color(0xFF475569),
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          // Features
          _buildFeatureRow(
            Icons.offline_bolt_outlined,
            'Real-time offline-first sync',
            context,
          ),
          const SizedBox(height: 16),
          _buildFeatureRow(
            Icons.tablet_android_outlined,
            'Responsive tablet & mobile layouts',
            context,
          ),
          const SizedBox(height: 16),
          _buildFeatureRow(
            Icons.receipt_long_outlined,
            'Detailed ledger ledger accounting',
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text, BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.teal, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: context.text.bodyMedium!.copyWith(
              color: const Color(0xFF334155),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
