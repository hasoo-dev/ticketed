import 'package:flutter/material.dart';
import '../../../core/constant/app_button.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/client_model.dart';
import '../../../models/line_item_model.dart';
import '../../../models/template_model.dart';
import '../widgets/line_item_card.dart';
import '../widgets/template_picker_sheet.dart';

class StepLineItems extends StatefulWidget {
  final ClientModel client;
  final String projectName;
  final List<LineItemModel> items;
  final double taxRate;
  final double discount;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onItemsChanged;

  const StepLineItems({
    super.key,
    required this.client,
    required this.projectName,
    required this.items,
    required this.taxRate,
    required this.discount,
    required this.onBack,
    required this.onNext,
    required this.onItemsChanged,
  });

  @override
  State<StepLineItems> createState() => _StepLineItemsState();
}

class _StepLineItemsState extends State<StepLineItems> {
  void _addNewItem() {
    setState(() {
      widget.items.add(
        LineItemModel(
          id: 'item-${DateTime.now().millisecondsSinceEpoch}',
          description: '',
          quantity: 1,
          unitPrice: 0.0,
        ),
      );
    });
    widget.onItemsChanged();
  }

  void _openTemplatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TemplatePickerSheet(
        onTemplateSelected: (TemplateModel template) {
          setState(() {
            for (var item in template.defaultItems) {
              widget.items.add(item.copyWith(id: 'item-${DateTime.now().millisecondsSinceEpoch}-${item.id}'));
            }
          });
          widget.onItemsChanged();
        },
      ),
    );
  }

  double get subtotal => widget.items.fold(0.0, (sum, i) => sum + i.subtotal);
  double get taxAmount => subtotal * widget.taxRate;
  double get total => subtotal + taxAmount - widget.discount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Context Summary Card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PROJECT CONTEXT",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      4.vSpace,
                      Text(
                        widget.projectName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.client.name,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: widget.onBack,
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text("EDIT"),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.darkBorder,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ),
          16.vSpace,
          // Action buttons: Add Item & Insert Template
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _addNewItem,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text("ADD ITEM"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppColors.darkBorder, width: 1.2),
                    foregroundColor: AppColors.darkBorder,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              12.hSpace,
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _openTemplatePicker,
                  icon: const Icon(Icons.description, size: 18),
                  label: const Text("TEMPLATE"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: const Color(0xffDDE2F3),
                    foregroundColor: const Color(0xff161C27),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
          16.vSpace,
          // Work Items List
          if (widget.items.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Icon(Icons.format_list_bulleted, size: 40, color: Colors.grey.shade400),
                  12.vSpace,
                  const Text(
                    "No work items yet",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  4.vSpace,
                  Text(
                    "Add manual items or insert a pre-built trade template.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return LineItemCard(
                  key: ValueKey(item.id),
                  item: item,
                  index: index,
                  onDelete: () {
                    setState(() {
                      widget.items.removeAt(index);
                    });
                    widget.onItemsChanged();
                  },
                  onUpdate: () {
                    setState(() {});
                    widget.onItemsChanged();
                  },
                );
              },
            ),
          16.vSpace,
          // Running Total Summary Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                6.vSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax (${(widget.taxRate * 100).toStringAsFixed(0)}%)"),
                    Text("\$${taxAmount.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                const Divider(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("ESTIMATED TOTAL", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.darkBorder,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.vSpace,
          // Nav buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onBack,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("← BACK"),
                ),
              ),
              12.hSpace,
              Expanded(
                flex: 2,
                child: AppButton(
                  text: "NEXT: REVIEW & SEND →",
                  backgroundColor: AppColors.darkBorder,
                  textColor: Colors.white,
                  onPressed: () {
                    if (widget.items.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please add at least one line item.")),
                      );
                      return;
                    }
                    widget.onNext();
                  },
                ),
              ),
            ],
          ),
          16.vSpace,
        ],
      ),
    );
  }
}
