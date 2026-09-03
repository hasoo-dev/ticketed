class LineItemModel {
  final String id;
  String description;
  double quantity;
  double unitPrice;
  String unit; // e.g. 'hrs', 'sq ft', 'units', 'm', 'ea'

  LineItemModel({
    required this.id,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    this.unit = 'units',
  });

  double get subtotal => quantity * unitPrice;

  LineItemModel copyWith({
    String? id,
    String? description,
    double? quantity,
    double? unitPrice,
    String? unit,
  }) {
    return LineItemModel(
      id: id ?? this.id,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'unit': unit,
    };
  }

  factory LineItemModel.fromMap(Map<String, dynamic> map) {
    return LineItemModel(
      id: map['id'] ?? '',
      description: map['description'] ?? '',
      quantity: (map['quantity'] as num?)?.toDouble() ?? 1.0,
      unitPrice: (map['unitPrice'] as num?)?.toDouble() ?? 0.0,
      unit: map['unit'] ?? 'units',
    );
  }
}
