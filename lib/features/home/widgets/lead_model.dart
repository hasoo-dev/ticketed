import 'dart:ui';

class LeadModel {
  final String initials;
  final String name;
  final String service;
  final String status;
  final String price;
  final Color statusColor;
  final Color stripColor;
  final Color avatarColor;

  LeadModel({
    required this.initials,
    required this.name,
    required this.service,
    required this.status,
    required this.price,
    required this.statusColor,
    required this.stripColor,
    required this.avatarColor,
  });
}