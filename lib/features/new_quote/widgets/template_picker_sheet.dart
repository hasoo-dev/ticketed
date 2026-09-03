import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/template_model.dart';
import '../../../services/template_service.dart';

class TemplatePickerSheet extends StatelessWidget {
  final ValueChanged<TemplateModel> onTemplateSelected;

  const TemplatePickerSheet({
    super.key,
    required this.onTemplateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final templates = TemplateService().templates;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pick a Template",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff181C1E),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Text(
            "Select an industry standard template to automatically populate line items.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
          16.vSpace,
          Expanded(
            child: ListView.builder(
              itemCount: templates.length,
              itemBuilder: (context, index) {
                final t = templates[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    title: Text(
                      t.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        4.vSpace,
                        Text(
                          t.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        8.vSpace,
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.darkBorder.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                t.trade,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBorder,
                                ),
                              ),
                            ),
                            8.hSpace,
                            Text(
                              '${t.defaultItems.length} items • ~\$${t.estimatedTotal.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.darkBorder,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      onTemplateSelected(t);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
