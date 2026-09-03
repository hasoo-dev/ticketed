import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
 

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(-6, -6),
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            checkColor: Colors.white,
            activeColor:  Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),

        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                text,
                style: context.text.bodyMedium!.copyWith(
                  fontSize: 10.sp
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}