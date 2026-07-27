extension StringExtension on String {
  /// Capitalize first letter.
  String get capitalize => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  /// Title case every word.
  String get titleCase => split(' ').map((w) => w.capitalize).join(' ');

  /// Check if the string is a valid email.
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  /// Check if the string is a valid phone number.
  bool get isPhone => RegExp(r'^\+?[0-9]{10,15}$').hasMatch(replaceAll(' ', ''));

  /// Check if string is numeric.
  bool get isNumeric => double.tryParse(this) != null;

  /// Return null if empty or whitespace.
  String? get nullIfEmpty => trim().isEmpty ? null : this;

  /// Truncate with ellipsis.
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
