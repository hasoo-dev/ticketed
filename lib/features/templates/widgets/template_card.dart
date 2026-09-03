import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/template_model.dart';

class TemplateCard extends StatelessWidget {
  final TemplateModel template;
  final VoidCallback? onUse;
  final VoidCallback? onTap;

  const TemplateCard({
    super.key,
    required this.template,
    this.onUse,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.darkBorder.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        template.trade.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkBorder,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Text(
                      'Used ${template.usageCount} times',
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                10.vSpace,
                Text(
                  template.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff181C1E),
                  ),
                ),
                6.vSpace,
                Text(
                  template.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                14.vSpace,
                const Divider(height: 1),
                12.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${template.defaultItems.length} line items included',
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                        ),
                        Text(
                          '~\$${template.estimatedTotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: AppColors.darkBorder,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: onUse,
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text("USE TEMPLATE"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBorder,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
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
