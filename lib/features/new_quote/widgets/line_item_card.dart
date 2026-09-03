import 'package:flutter/material.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/line_item_model.dart';

class LineItemCard extends StatefulWidget {
  final LineItemModel item;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const LineItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  State<LineItemCard> createState() => _LineItemCardState();
}

class _LineItemCardState extends State<LineItemCard> {
  late TextEditingController _descController;
  late TextEditingController _qtyController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _descController = TextEditingController(text: widget.item.description);
    _qtyController = TextEditingController(text: widget.item.quantity.toStringAsFixed(widget.item.quantity.truncateToDouble() == widget.item.quantity ? 0 : 2));
    _priceController = TextEditingController(text: widget.item.unitPrice.toStringAsFixed(2));
  }

  @override
  void didUpdateWidget(covariant LineItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      if (_descController.text != widget.item.description) {
        _descController.text = widget.item.description;
      }
      final qtyStr = widget.item.quantity.toStringAsFixed(widget.item.quantity.truncateToDouble() == widget.item.quantity ? 0 : 2);
      if (_qtyController.text != qtyStr) {
        _qtyController.text = qtyStr;
      }
      final priceStr = widget.item.unitPrice.toStringAsFixed(2);
      if (_priceController.text != priceStr) {
        _priceController.text = priceStr;
      }
    }
  }

  @override
  void dispose() {
    _descController.dispose();
    _qtyController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with item number and delete button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'ITEM #${widget.index + 1}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              InkWell(
                onTap: widget.onDelete,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.red.shade400,
                  ),
                ),
              ),
            ],
          ),
          12.vSpace,
          // Description Input
          Text(
            "DESCRIPTION",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: Colors.grey.shade600,
            ),
          ),
          6.vSpace,
          TextField(
            controller: _descController,
            decoration: InputDecoration(
              hintText: "e.g., Heavy-duty ducting, Master labor...",
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
              ),
            ),
            onChanged: (val) {
              widget.item.description = val;
              widget.onUpdate();
            },
          ),
          12.vSpace,
          // Quantity and Unit Price row
          Row(
            children: [
              // Quantity
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "QUANTITY",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    6.vSpace,
                    TextField(
                      controller: _qtyController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
                        ),
                      ),
                      onChanged: (val) {
                        final parsed = double.tryParse(val) ?? 0.0;
                        widget.item.quantity = parsed;
                        widget.onUpdate();
                      },
                    ),
                  ],
                ),
              ),
              12.hSpace,
              // Unit Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UNIT PRICE (\$)",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    6.vSpace,
                    TextField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        prefixText: "\$ ",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.darkBorder, width: 1.5),
                        ),
                      ),
                      onChanged: (val) {
                        final parsed = double.tryParse(val) ?? 0.0;
                        widget.item.unitPrice = parsed;
                        widget.onUpdate();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.vSpace,
          // Subtotal footer
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "SUBTOTAL: ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                "\$${widget.item.subtotal.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkBorder,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
