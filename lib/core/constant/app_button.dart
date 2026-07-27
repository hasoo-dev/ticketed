import 'package:flutter/material.dart';
import '../extensions/theme_extensions.dart';
import '../theme/app_colors.dart' show AppColors;
import 'app_radius.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;

  final double? width;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    this.textSize,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,

    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.darkTextSecondary;
    final fg = textColor ?? AppColors.kSecondaryColor;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: AppRadius.br12,
          child: Ink(
            decoration: BoxDecoration(
              color: isOutlined ? Colors.transparent : bg,
              borderRadius: AppRadius.br12,
              border: Border.all(color: fg, width: 1.5),
            ),
            child: Center(child: _buildChild(context, isOutlined ? bg : fg)),
          ),
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, Color color) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }
    return Text(
      text,
      style: context.text.titleMedium?.copyWith(
        fontSize: textSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
