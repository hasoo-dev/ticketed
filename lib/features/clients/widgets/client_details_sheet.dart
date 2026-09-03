import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_button.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';
import '../../../services/quote_service.dart';

class ClientDetailsSheet extends StatelessWidget {
  final ClientModel client;

  const ClientDetailsSheet({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final clientQuotes = QuoteService().quotes.where((q) => q.client.id == client.id || q.client.name == client.name).toList();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            16.vSpace,
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: client.avatarColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    client.initials,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: AppColors.darkBorder,
                    ),
                  ),
                ),
                14.hSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        client.company,
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            16.vSpace,
            // Contact & Info rows
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, size: 16, color: AppColors.darkBorder),
                      10.hSpace,
                      Text(client.email, style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  10.vSpace,
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, size: 16, color: AppColors.darkBorder),
                      10.hSpace,
                      Text(client.phone, style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  10.vSpace,
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16, color: AppColors.darkBorder),
                      10.hSpace,
                      Expanded(
                        child: Text(client.address, style: const TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.vSpace,
            Text(
              "ESTIMATE HISTORY (${clientQuotes.length})",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: Colors.grey.shade600,
              ),
            ),
            8.vSpace,
            if (clientQuotes.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "No past quotes recorded for this client.",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              )
            else
              ...clientQuotes.map((q) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(q.quoteNumber, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          Text(q.projectName, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                        ],
                      ),
                      Text(
                        '\$${q.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkBorder),
                      ),
                    ],
                  ),
                );
              }),
            16.vSpace,
            AppButton(
              text: "CREATE NEW QUOTE FOR CLIENT ⚡",
              backgroundColor: AppColors.darkBorder,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                context.push(RoutesName.newQuote);
              },
            ),
            16.vSpace,
          ],
        ),
      ),
    );
  }
}
