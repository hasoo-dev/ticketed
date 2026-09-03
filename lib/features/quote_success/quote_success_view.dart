import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../models/quote_model.dart';

class QuoteSuccessView extends StatelessWidget {
  final QuoteModel quote;

  const QuoteSuccessView({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Success Icon Badge
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: Color(0xffDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xff16A34A),
                  size: 56,
                ),
              ),
              24.vSpace,
              Text(
                quote.isSigned ? "Estimate Signed & Approved!" : "Estimate Dispatched Successfully!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff181C1E),
                ),
              ),
              10.vSpace,
              Text(
                quote.isSigned
                    ? "Thank you! The estimate for ${quote.projectName} has been authorized and archived."
                    : "Quote ${quote.quoteNumber} has been generated and queued for ${quote.client.name}.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              24.vSpace,
              // Reference Details Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Quote Reference", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text(quote.quoteNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    8.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Amount", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text(
                          "\$${quote.total.toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.darkBorder),
                        ),
                      ],
                    ),
                    8.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Client", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('${quote.client.name} (${quote.client.company})', style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Actions
              AppButton(
                text: "VIEW ESTIMATE DOCUMENT",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
                onPressed: () {
                  context.pushReplacement(RoutesName.quotePreview, extra: quote);
                },
              ),
              12.vSpace,
              OutlinedButton(
                onPressed: () {
                  context.go(RoutesName.main);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("RETURN TO DASHBOARD"),
              ),
              16.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
