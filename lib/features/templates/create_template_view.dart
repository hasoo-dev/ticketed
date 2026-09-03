import 'package:flutter/material.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../models/line_item_model.dart';
import '../../models/template_model.dart';
import '../../services/template_service.dart';
import '../new_quote/widgets/line_item_card.dart';

class CreateTemplateView extends StatefulWidget {
  const CreateTemplateView({super.key});

  @override
  State<CreateTemplateView> createState() => _CreateTemplateViewState();
}

class _CreateTemplateViewState extends State<CreateTemplateView> {
  final TemplateService _templateService = TemplateService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String _selectedTrade = 'HVAC';
  final List<LineItemModel> _items = [];

  final trades = ['HVAC', 'Electrician', 'Plumber', 'General Contractor', 'Roofing', 'Painting'];

  @override
  void initState() {
    super.initState();
    _items.add(
      LineItemModel(
        id: 'new-1',
        description: 'Standard Service Call & Diagnostic Inspection',
        quantity: 1,
        unitPrice: 120.0,
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onSaveTemplate() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter template title.")),
      );
      return;
    }
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add at least one line item.")),
      );
      return;
    }

    final newTemplate = TemplateModel(
      id: 'custom-${DateTime.now().millisecondsSinceEpoch}',
      title: _titleController.text.trim(),
      trade: _selectedTrade,
      description: _descController.text.trim().isNotEmpty
          ? _descController.text.trim()
          : "Custom standardized estimation template for $_selectedTrade jobs.",
      defaultItems: _items,
      usageCount: 0,
    );

    _templateService.addTemplate(newTemplate);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Template created successfully!")),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Create Template",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Standardize line items for recurring trades and rapid estimation.",
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              16.vSpace,
              // Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Template Title",
                        hintText: "e.g., EV Charger 240V Install",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    14.vSpace,
                    DropdownButtonFormField<String>(
                      initialValue: _selectedTrade,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Trade Category",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      items: trades.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedTrade = val);
                      },
                    ),
                    14.vSpace,
                    TextField(
                      controller: _descController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: "Description / Notes",
                        hintText: "Short scope summary for when to use this template...",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
              20.vSpace,
              // Preset Line Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "PRESET LINE ITEMS",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: AppColors.darkBorder,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _items.add(LineItemModel(
                          id: 'new-${DateTime.now().millisecondsSinceEpoch}',
                          description: '',
                          quantity: 1,
                          unitPrice: 0.0,
                        ));
                      });
                    },
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text("Add Item"),
                  ),
                ],
              ),
              8.vSpace,
              ..._items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return LineItemCard(
                  key: ValueKey(item.id),
                  item: item,
                  index: index,
                  onDelete: () {
                    setState(() => _items.removeAt(index));
                  },
                  onUpdate: () => setState(() {}),
                );
              }),
              20.vSpace,
              AppButton(
                text: "SAVE TEMPLATE 💾",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
                onPressed: _onSaveTemplate,
              ),
              20.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
