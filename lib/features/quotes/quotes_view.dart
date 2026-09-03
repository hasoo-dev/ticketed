import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../models/quote_model.dart';
import '../../services/quote_service.dart';
import '../auth/widgets/app_textfield.dart';
import 'widgets/quote_card.dart';
import 'widgets/quote_filter_chips.dart';

class QoutesView extends StatefulWidget {
  const QoutesView({super.key});

  @override
  State<QoutesView> createState() => _QoutesViewState();
}

class _QoutesViewState extends State<QoutesView> {
  final QuoteService _quoteService = QuoteService();
  final TextEditingController _searchController = TextEditingController();
  QuoteStatus? _selectedStatus;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _quoteService.addListener(_onServiceUpdate);
  }

  @override
  void dispose() {
    _quoteService.removeListener(_onServiceUpdate);
    _searchController.dispose();
    super.dispose();
  }

  void _onServiceUpdate() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filteredQuotes = _quoteService.searchQuotes(
      _searchQuery,
      status: _selectedStatus,
    );

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: context.text.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(RoutesName.newQuote);
            },
            icon: const Icon(Icons.add_circle, color: AppColors.darkBorder, size: 28),
            tooltip: "New Quote",
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
                "Track, manage, and dispatch estimates with live status tracking.",
                style: context.text.labelLarge!.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              16.vSpace,
              // Search Field
              AppTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search quote number, client, project...",
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
              ),
              16.vSpace,
              // Status Filters
              QuoteFilterChips(
                selectedStatus: _selectedStatus,
                onSelected: (status) {
                  setState(() {
                    _selectedStatus = status;
                  });
                },
              ),
              18.vSpace,
              // Count banner
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${filteredQuotes.length} ${filteredQuotes.length == 1 ? "Estimate" : "Estimates"}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBorder,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'Pending: ${_quoteService.pendingQuotesCount}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              12.vSpace,
              // Quotes List
              if (filteredQuotes.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      12.vSpace,
                      const Text(
                        "No quotes found",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      4.vSpace,
                      Text(
                        "Try selecting a different filter or tap '+' to create one.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredQuotes.length,
                  itemBuilder: (context, index) {
                    final quote = filteredQuotes[index];
                    return QuoteCard(
                      quote: quote,
                      onTap: () {
                        context.push(RoutesName.quotePreview, extra: quote);
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
