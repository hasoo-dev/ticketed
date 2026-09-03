import 'package:flutter/material.dart';
import 'client_model.dart';
import 'line_item_model.dart';

enum QuoteStatus {
  draft,
  sent,
  viewed,
  accepted,
  declined,
}

extension QuoteStatusExtension on QuoteStatus {
  String get displayName {
    switch (this) {
      case QuoteStatus.draft:
        return 'DRAFT';
      case QuoteStatus.sent:
        return 'SENT';
      case QuoteStatus.viewed:
        return 'VIEWED';
      case QuoteStatus.accepted:
        return 'ACCEPTED';
      case QuoteStatus.declined:
        return 'DECLINED';
    }
  }

  Color get color {
    switch (this) {
      case QuoteStatus.draft:
        return Colors.grey.shade600;
      case QuoteStatus.sent:
        return const Color(0xffD97706);
      case QuoteStatus.viewed:
        return const Color(0xff2563EB);
      case QuoteStatus.accepted:
        return const Color(0xff16A34A);
      case QuoteStatus.declined:
        return const Color(0xffDC2626);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case QuoteStatus.draft:
        return Colors.grey.shade200;
      case QuoteStatus.sent:
        return const Color(0xffFEF3C7);
      case QuoteStatus.viewed:
        return const Color(0xffDBEAFE);
      case QuoteStatus.accepted:
        return const Color(0xffDCFCE7);
      case QuoteStatus.declined:
        return const Color(0xffFEE2E2);
    }
  }
}

class QuoteModel {
  final String id;
  final String quoteNumber;
  final ClientModel client;
  final String projectName;
  final String siteAddress;
  final List<LineItemModel> items;
  final double taxRate; // e.g. 0.10 for 10%
  final double discount;
  final QuoteStatus status;
  final DateTime createdAt;
  final DateTime? validUntil;
  final String paymentTerms;
  final String notes;
  final String? signatureName;
  final String? signatureDate;
  final bool isSigned;

  QuoteModel({
    required this.id,
    required this.quoteNumber,
    required this.client,
    required this.projectName,
    required this.siteAddress,
    required this.items,
    this.taxRate = 0.08,
    this.discount = 0.0,
    this.status = QuoteStatus.sent,
    required this.createdAt,
    this.validUntil,
    this.paymentTerms = "Net 30. 50% deposit required upon acceptance.",
    this.notes = "All work carried out according to standard industrial safety regulations.",
    this.signatureName,
    this.signatureDate,
    this.isSigned = false,
  });

  double get subtotal => items.fold(0.0, (sum, item) => sum + item.subtotal);
  double get taxAmount => (subtotal - discount) > 0 ? (subtotal - discount) * taxRate : 0.0;
  double get total => (subtotal - discount) + taxAmount;

  QuoteModel copyWith({
    String? id,
    String? quoteNumber,
    ClientModel? client,
    String? projectName,
    String? siteAddress,
    List<LineItemModel>? items,
    double? taxRate,
    double? discount,
    QuoteStatus? status,
    DateTime? createdAt,
    DateTime? validUntil,
    String? paymentTerms,
    String? notes,
    String? signatureName,
    String? signatureDate,
    bool? isSigned,
  }) {
    return QuoteModel(
      id: id ?? this.id,
      quoteNumber: quoteNumber ?? this.quoteNumber,
      client: client ?? this.client,
      projectName: projectName ?? this.projectName,
      siteAddress: siteAddress ?? this.siteAddress,
      items: items ?? this.items,
      taxRate: taxRate ?? this.taxRate,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      validUntil: validUntil ?? this.validUntil,
      paymentTerms: paymentTerms ?? this.paymentTerms,
      notes: notes ?? this.notes,
      signatureName: signatureName ?? this.signatureName,
      signatureDate: signatureDate ?? this.signatureDate,
      isSigned: isSigned ?? this.isSigned,
    );
  }
}
