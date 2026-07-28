import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/core/constant/app_button.dart';
import 'package:ticketed/core/routes/routes_name.dart';

import '../extensions/int_extension.dart';
import '../extensions/theme_extensions.dart';
import '../theme/app_colors.dart';

class Helpers {
  /// Dismiss the keyboard.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static Future<T?> showAppBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: true,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: child,
          ),
        );
      },
    );
  }

  /// Show a snackbar.
  static void showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.text.bodySmall!.copyWith(fontSize: 12.sp),
        ),
        backgroundColor: isError
            ? Colors.red.shade600
            : AppColors.kPrimaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Copy text to clipboard and show feedback.
  static Future<void> copyToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      showSnackBar(context, 'Copied to clipboard');
    }
  }

  /// Return screen width.
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  /// Return screen height.
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static Future<void> loginSuccess({
    required BuildContext context,
    VoidCallback? onContinue,
  }) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: false,
      showDragHandle: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: .start,
              crossAxisAlignment: .center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green.shade50,
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Login Successful!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Welcome back! You're now signed in and ready to explore events, manage your bookings, and enjoy Ticketed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                12.vSpace,
                AppButton(
                  onPressed: () {
                    context.go(RoutesName.main);
                  },
                  text: "Continue",
                  backgroundColor: AppColors.darkBorder,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
