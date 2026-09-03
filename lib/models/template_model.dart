import 'line_item_model.dart';

class TemplateModel {
  final String id;
  final String title;
  final String trade; // e.g. 'Electrical', 'HVAC', 'Plumbing', 'General Contractor'
  final String description;
  final List<LineItemModel> defaultItems;
  final int usageCount;

  TemplateModel({
    required this.id,
    required this.title,
    required this.trade,
    required this.description,
    required this.defaultItems,
    this.usageCount = 0,
  });

  double get estimatedTotal =>
      defaultItems.fold(0.0, (sum, item) => sum + item.subtotal);

  TemplateModel copyWith({
    String? id,
    String? title,
    String? trade,
    String? description,
    List<LineItemModel>? defaultItems,
    int? usageCount,
  }) {
    return TemplateModel(
      id: id ?? this.id,
      title: title ?? this.title,
      trade: trade ?? this.trade,
      description: description ?? this.description,
      defaultItems: defaultItems ?? this.defaultItems,
      usageCount: usageCount ?? this.usageCount,
    );
  }
}
