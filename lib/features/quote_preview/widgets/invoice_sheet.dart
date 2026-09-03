import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/quote_model.dart';

class InvoiceSheet extends StatelessWidget {
  final QuoteModel quote;

  const InvoiceSheet({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Industrial Header Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: AppColors.darkBorder,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "INDUSTRIAL PRECISION ESTIMATE",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    4.vSpace,
                    Text(
                      quote.quoteNumber,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    quote.status.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contractor and Client details
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contractor Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ISSUED BY",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.shade600,
                              letterSpacing: 1,
                            ),
                          ),
                          4.vSpace,
                          const Text(
                            "Apex Industrial Contracting",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            "Licensed & Insured\nSeattle, WA • (555) 100-9900",
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                    12.hSpace,
                    // Client Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PREPARED FOR",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey.shade600,
                              letterSpacing: 1,
                            ),
                          ),
                          4.vSpace,
                          Text(
                            quote.client.name,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            '${quote.client.company}\n${quote.siteAddress}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                16.vSpace,
                const Divider(height: 1),
                16.vSpace,
                // Project Scope
                Text(
                  "PROJECT SCOPE",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade600,
                    letterSpacing: 1,
                  ),
                ),
                4.vSpace,
                Text(
                  quote.projectName,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                16.vSpace,
                // Line Items Table
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("DESCRIPTION", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("QTY", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("RATE", textAlign: TextAlign.right, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text("AMOUNT", textAlign: TextAlign.right, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                8.vSpace,
                ...quote.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.description,
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${item.quantity.toStringAsFixed(item.quantity.truncateToDouble() == item.quantity ? 0 : 1)} ${item.unit}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$${item.unitPrice.toStringAsFixed(2)}',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              '\$${item.subtotal.toStringAsFixed(2)}',
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const Divider(height: 24),
                // Totals
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Subtotal:", style: TextStyle(fontSize: 12)),
                            Text("\$${quote.subtotal.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                          ],
                        ),
                        4.vSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax (${(quote.taxRate * 100).toStringAsFixed(0)}%):", style: const TextStyle(fontSize: 12)),
                            Text("\$${quote.taxAmount.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                          ],
                        ),
                        const Divider(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("TOTAL:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                            Text(
                              "\$${quote.total.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: AppColors.darkBorder,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                16.vSpace,
                const Divider(height: 24),
                // Signature or Authorization Section
                Text(
                  "AUTHORIZATION / SIGNATURE",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade600,
                    letterSpacing: 1,
                  ),
                ),
                8.vSpace,
                if (quote.isSigned)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffDCFCE7),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.verified, color: Colors.green, size: 24),
                        10.hSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Digitally Signed by ${quote.signatureName ?? quote.client.name}",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green),
                            ),
                            Text(
                              "Date: ${quote.signatureDate ?? 'Verified & Timestamped'}",
                              style: TextStyle(fontSize: 11, color: Colors.green.shade800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "✍️ Awaiting Client Digital Signature",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
