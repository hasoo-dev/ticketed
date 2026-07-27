import 'package:flutter/services.dart';

class CurrencyFormatter {
  /// Format a number as currency string: Rs. 1,234.56
  static String format(double amount, {String symbol = 'Rs.', int decimals = 2}) {
    final parts = amount.toStringAsFixed(decimals).split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? '.${parts[1]}' : '';

    // Add comma separators
    final buffer = StringBuffer();
    int count = 0;
    for (int i = intPart.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(intPart[i]);
      count++;
    }
    final formatted = buffer.toString().split('').reversed.join();
    return '$symbol $formatted$decPart';
  }

  /// TextInputFormatter to allow only digits and single decimal.
  static TextInputFormatter digitsOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));
  }
}
