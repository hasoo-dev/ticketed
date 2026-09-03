import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final QuoteModel quote;
  final VoidCallback? onTap;
  final VoidCallback? onPreview;
  final VoidCallback? onSign;

  const QuoteCard({
    super.key,
    required this.quote,
    this.onTap,
    this.onPreview,
    this.onSign,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = quote.status.color;
    final statusBgColor = quote.status.backgroundColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap ?? onPreview,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Ref number, initials avatar, and status badge
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: quote.client.avatarColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        quote.client.initials,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.darkBorder,
                        ),
                      ),
                    ),
                    12.hSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quote.client.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            quote.quoteNumber,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: statusColor.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        quote.status.displayName,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                12.vSpace,
                // Project Name
                Text(
                  quote.projectName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff181C1E),
                  ),
                ),
                6.vSpace,
                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    4.hSpace,
                    Expanded(
                      child: Text(
                        quote.siteAddress,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                12.vSpace,
                const Divider(height: 1),
                10.vSpace,
                // Bottom Row: Line items count, total price, and action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${quote.items.length} ${quote.items.length == 1 ? "Item" : "Items"}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${quote.total.toStringAsFixed(2)}',
                          style: context.text.titleLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkBorder,
                          ),
                        ),
                        8.hSpace,
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
