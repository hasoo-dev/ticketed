import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/routes/routes_name.dart';
import '../../models/client_model.dart';
import '../../models/line_item_model.dart';
import '../../models/quote_model.dart';
import '../../services/client_service.dart';
import '../../services/quote_service.dart';
import 'steps/step_line_items.dart';
import 'steps/step_project_setup.dart';
import 'steps/step_review_send.dart';
import 'widgets/quote_step_indicator.dart';

class NewQuoteView extends StatefulWidget {
  final QuoteModel? initialQuote;

  const NewQuoteView({super.key, this.initialQuote});

  @override
  State<NewQuoteView> createState() => _NewQuoteViewState();
}

class _NewQuoteViewState extends State<NewQuoteView> {
  final QuoteService _quoteService = QuoteService();
  int _currentStep = 1;

  late String _quoteNumber;
  ClientModel? _selectedClient;
  String _projectName = '';
  String _siteAddress = '';
  final List<LineItemModel> _items = [];
  double _taxRate = 0.08;
  double _discount = 0.0;
  String _paymentTerms = "Net 30. 50% deposit required upon acceptance.";
  String _notes = "All work carried out according to standard industrial safety regulations.";

  @override
  void initState() {
    super.initState();
    if (widget.initialQuote != null) {
      final q = widget.initialQuote!;
      _quoteNumber = q.quoteNumber;
      _selectedClient = q.client;
      _projectName = q.projectName;
      _siteAddress = q.siteAddress;
      _items.addAll(q.items.map((i) => i.copyWith()));
      _taxRate = q.taxRate;
      _discount = q.discount;
      _paymentTerms = q.paymentTerms;
      _notes = q.notes;
    } else {
      _quoteNumber = _quoteService.generateNextQuoteNumber();
      final clients = ClientService().clients;
      if (clients.isNotEmpty) {
        _selectedClient = clients.first;
        _siteAddress = clients.first.address;
      }
      _projectName = "Facility Maintenance & Repair";
    }
  }

  QuoteModel _buildQuoteModel({QuoteStatus status = QuoteStatus.sent}) {
    return QuoteModel(
      id: widget.initialQuote?.id ?? 'q-${DateTime.now().millisecondsSinceEpoch}',
      quoteNumber: _quoteNumber,
      client: _selectedClient!,
      projectName: _projectName,
      siteAddress: _siteAddress,
      items: _items,
      taxRate: _taxRate,
      discount: _discount,
      status: status,
      createdAt: DateTime.now(),
      validUntil: DateTime.now().add(const Duration(days: 30)),
      paymentTerms: _paymentTerms,
      notes: _notes,
    );
  }

  void _onSend() {
    final quote = _buildQuoteModel(status: QuoteStatus.sent);
    if (widget.initialQuote != null) {
      _quoteService.updateQuote(quote);
    } else {
      _quoteService.addQuote(quote);
    }
    context.pushReplacement(RoutesName.quoteSuccess, extra: quote);
  }

  void _onPreview() {
    if (_selectedClient == null || _items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please configure client and line items before previewing.")),
      );
      return;
    }
    final quote = _buildQuoteModel(status: QuoteStatus.draft);
    context.push(RoutesName.quotePreview, extra: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.initialQuote != null ? "Edit Quote" : "Create New Quote",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_currentStep > 1) {
              setState(() => _currentStep--);
            } else {
              context.pop();
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              QuoteStepIndicator(currentStep: _currentStep),
              12.vSpace,
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _buildCurrentStepWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStepWidget() {
    switch (_currentStep) {
      case 1:
        return StepProjectSetup(
          key: const ValueKey(1),
          quoteNumber: _quoteNumber,
          selectedClient: _selectedClient,
          projectName: _projectName,
          siteAddress: _siteAddress,
          onClientChanged: (client) => setState(() => _selectedClient = client),
          onProjectNameChanged: (val) => _projectName = val,
          onSiteAddressChanged: (val) => _siteAddress = val,
          onNext: () => setState(() => _currentStep = 2),
        );
      case 2:
        return StepLineItems(
          key: const ValueKey(2),
          client: _selectedClient!,
          projectName: _projectName,
          items: _items,
          taxRate: _taxRate,
          discount: _discount,
          onBack: () => setState(() => _currentStep = 1),
          onNext: () => setState(() => _currentStep = 3),
          onItemsChanged: () => setState(() {}),
        );
      case 3:
        return StepReviewSend(
          key: const ValueKey(3),
          quoteNumber: _quoteNumber,
          client: _selectedClient!,
          projectName: _projectName,
          siteAddress: _siteAddress,
          items: _items,
          taxRate: _taxRate,
          discount: _discount,
          paymentTerms: _paymentTerms,
          notes: _notes,
          onBack: () => setState(() => _currentStep = 2),
          onPreview: _onPreview,
          onSendQuote: _onSend,
        );
      default:
        return const SizedBox();
    }
  }
}
