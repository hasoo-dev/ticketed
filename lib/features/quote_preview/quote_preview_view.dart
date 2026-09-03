import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../models/quote_model.dart';
import 'widgets/invoice_sheet.dart';

class QuotePreviewView extends StatelessWidget {
  final QuoteModel quote;

  const QuotePreviewView({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F4F6),
      appBar: AppBar(
        title: Text(
          "Quote Preview",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: "Share Link",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Link copied for ${quote.quoteNumber}")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: "Edit Quote",
            onPressed: () {
              context.push(RoutesName.editQuote, extra: quote);
            },
          ),
          12.hSpace,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              InvoiceSheet(quote: quote),
              20.vSpace,
              if (!quote.isSigned) ...[
                AppButton(
                  text: "PROCEED TO SIGN QUOTE ✍️",
                  backgroundColor: AppColors.darkBorder,
                  textColor: Colors.white,
                  onPressed: () {
                    context.push(RoutesName.signQuote, extra: quote);
                  },
                ),
                10.vSpace,
              ],
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Exporting PDF estimate...")),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text("DOWNLOAD PDF"),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: AppColors.darkBorder),
                  foregroundColor: AppColors.darkBorder,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              20.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
