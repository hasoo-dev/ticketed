import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class QuoteStepIndicator extends StatelessWidget {
  final int currentStep; // 1, 2, 3

  const QuoteStepIndicator({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    const steps = [
      {'num': 1, 'label': 'Setup'},
      {'num': 2, 'label': 'Line Items'},
      {'num': 3, 'label': 'Review & Send'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'STEP $currentStep OF 3',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: AppColors.darkBorder,
                ),
              ),
              Text(
                steps[currentStep - 1]['label'] as String,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(3, (index) {
              final stepIndex = index + 1;
              final isCompleted = currentStep > stepIndex;
              final isActive = currentStep == stepIndex;

              return Expanded(
                child: Container(
                  height: 4,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == 2 ? 0 : 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted || isActive
                        ? AppColors.darkBorder
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
