import 'package:flutter/material.dart';

class ClientModel {
  final String id;
  final String name;
  final String company;
  final String email;
  final String phone;
  final String address;
  final String initials;
  final int quotesCount;
  final double totalBilled;
  final Color avatarColor;

  ClientModel({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.address,
    required this.initials,
    this.quotesCount = 0,
    this.totalBilled = 0.0,
    this.avatarColor = const Color(0xffE6E8F8),
  });

  ClientModel copyWith({
    String? id,
    String? name,
    String? company,
    String? email,
    String? phone,
    String? address,
    String? initials,
    int? quotesCount,
    double? totalBilled,
    Color? avatarColor,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      company: company ?? this.company,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      initials: initials ?? this.initials,
      quotesCount: quotesCount ?? this.quotesCount,
      totalBilled: totalBilled ?? this.totalBilled,
      avatarColor: avatarColor ?? this.avatarColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'company': company,
      'email': email,
      'phone': phone,
      'address': address,
      'initials': initials,
      'quotesCount': quotesCount,
      'totalBilled': totalBilled,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      initials: map['initials'] ?? 'CL',
      quotesCount: map['quotesCount'] ?? 0,
      totalBilled: (map['totalBilled'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
