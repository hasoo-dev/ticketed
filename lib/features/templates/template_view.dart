import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../models/template_model.dart';
import '../../services/template_service.dart';
import '../auth/widgets/app_textfield.dart';
import 'widgets/template_card.dart';

class TempleteView extends StatefulWidget {
  const TempleteView({super.key});

  @override
  State<TempleteView> createState() => _TempleteViewState();
}

class _TempleteViewState extends State<TempleteView> {
  final TemplateService _templateService = TemplateService();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedTrade = 'All';

  final categories = ['All', 'HVAC', 'Electrician', 'General Contractor', 'Plumber', 'Roofing'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TemplateModel> templates = _templateService.searchTemplates(_searchQuery);
    if (_selectedTrade != 'All') {
      templates = templates.where((t) => t.trade.toLowerCase() == _selectedTrade.toLowerCase()).toList();
    }

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "My Templates",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: AppColors.darkBorder, size: 28),
            tooltip: "Create Template",
            onPressed: () async {
              await context.push(RoutesName.createTemplate);
              setState(() {});
            },
          ),
          12.hSpace,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manage and deploy standardized estimate structures.",
                style: context.text.labelLarge!.copyWith(color: Colors.grey.shade600),
              ),
              16.vSpace,
              // Search field
              AppTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search templates (e.g. Roofing, Electricity, HVAC...)",
                onChanged: (val) => setState(() => _searchQuery = val),
              ),
              14.vSpace,
              // Trade category chips
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isSelected = _selectedTrade == cat;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedTrade = cat),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.darkBorder : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? AppColors.darkBorder : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cat,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              18.vSpace,
              // Template count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${templates.length} ${templates.length == 1 ? "Template" : "Templates"}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBorder,
                    ),
                  ),
                ],
              ),
              12.vSpace,
              // Template Cards
              if (templates.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 40, color: Colors.grey.shade400),
                      12.vSpace,
                      const Text(
                        "No templates found",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      4.vSpace,
                      Text(
                        "Try a different search or create your own custom template.",
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
                  itemCount: templates.length,
                  itemBuilder: (context, index) {
                    final t = templates[index];
                    return TemplateCard(
                      template: t,
                      onUse: () {
                        context.push(RoutesName.newQuote);
                      },
                    );
                  },
                ),
              24.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
