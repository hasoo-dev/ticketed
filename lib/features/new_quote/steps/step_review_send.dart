import 'package:flutter/material.dart';
import '../../../core/constant/app_button.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';
import '../../../models/line_item_model.dart';

class StepReviewSend extends StatelessWidget {
  final String quoteNumber;
  final ClientModel client;
  final String projectName;
  final String siteAddress;
  final List<LineItemModel> items;
  final double taxRate;
  final double discount;
  final String paymentTerms;
  final String notes;
  final VoidCallback onBack;
  final VoidCallback onPreview;
  final VoidCallback onSendQuote;

  const StepReviewSend({
    super.key,
    required this.quoteNumber,
    required this.client,
    required this.projectName,
    required this.siteAddress,
    required this.items,
    required this.taxRate,
    required this.discount,
    required this.paymentTerms,
    required this.notes,
    required this.onBack,
    required this.onPreview,
    required this.onSendQuote,
  });

  double get subtotal => items.fold(0.0, (sum, i) => sum + i.subtotal);
  double get taxAmount => subtotal * taxRate;
  double get total => subtotal + taxAmount - discount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quote Review Document Card
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ESTIMATE SUMMARY",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                            color: AppColors.darkBorder,
                          ),
                        ),
                        2.vSpace,
                        Text(
                          quoteNumber,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: onPreview,
                      icon: const Icon(Icons.visibility, size: 16),
                      label: const Text("PREVIEW"),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        side: const BorderSide(color: AppColors.darkBorder),
                        foregroundColor: AppColors.darkBorder,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Client & Project Info
                Text(
                  "BILL TO",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                4.vSpace,
                Text(
                  '${client.name} — ${client.company}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${client.email} • ${client.phone}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                Text(
                  siteAddress,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                16.vSpace,
                Text(
                  "PROJECT",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                4.vSpace,
                Text(
                  projectName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Divider(height: 24),
                // Itemized Breakdown
                Text(
                  "ITEMIZED BREAKDOWN",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                10.vSpace,
                ...items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.description,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${item.quantity} ${item.unit} @ \$${item.unitPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$${item.subtotal.toStringAsFixed(2)}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const Divider(height: 20),
                // Financial Totals
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                6.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax (${(taxRate * 100).toStringAsFixed(0)}%)"),
                    Text("\$${taxAmount.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                const Divider(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "TOTAL AMOUNT",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.darkBorder,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Terms & Notes
                Text(
                  "TERMS & CONDITIONS",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                4.vSpace,
                Text(
                  paymentTerms,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          20.vSpace,
          // Dispatch / Send Actions
          AppButton(
            text: "SEND QUOTE TO CLIENT 🚀",
            backgroundColor: AppColors.darkBorder,
            textColor: Colors.white,
            onPressed: onSendQuote,
          ),
          10.vSpace,
          OutlinedButton.icon(
            onPressed: onPreview,
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: const Text("PREVIEW DIGITAL ESTIMATE"),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: const BorderSide(color: AppColors.darkBorder),
              foregroundColor: AppColors.darkBorder,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          10.vSpace,
          Center(
            child: TextButton(
              onPressed: onBack,
              child: const Text("← Back to Edit Items"),
            ),
          ),
          20.vSpace,
        ],
      ),
    );
  }
}
