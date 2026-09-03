import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/quote_model.dart';

class QuoteFilterChips extends StatelessWidget {
  final QuoteStatus? selectedStatus;
  final ValueChanged<QuoteStatus?> onSelected;

  const QuoteFilterChips({
    super.key,
    required this.selectedStatus,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final filters = <Map<String, dynamic>>[
      {'label': 'ALL', 'status': null},
      {'label': 'SENT', 'status': QuoteStatus.sent},
      {'label': 'VIEWED', 'status': QuoteStatus.viewed},
      {'label': 'ACCEPTED', 'status': QuoteStatus.accepted},
      {'label': 'DECLINED', 'status': QuoteStatus.declined},
      {'label': 'DRAFT', 'status': QuoteStatus.draft},
    ];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = filters[index];
          final status = item['status'] as QuoteStatus?;
          final isSelected = selectedStatus == status;

          return GestureDetector(
            onTap: () => onSelected(status),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.darkBorder : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.darkBorder : Colors.grey.shade300,
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: isSelected ? Colors.white : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
