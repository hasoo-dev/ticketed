class Formatter {
  /// Capitalize the first letter of a string.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Capitalize first letter of every word.
  static String titleCase(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((w) => capitalize(w)).join(' ');
  }

  /// Remove extra whitespace and trim.
  static String cleanWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Truncate with ellipsis.
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Mask phone number: +92 3** *** **45
  static String maskPhone(String phone) {
    if (phone.length < 4) return phone;
    final masked = '*' * (phone.length - 5);
    return '${phone.substring(0, 3)}$masked${phone.substring(phone.length - 2)}';
  }
}
