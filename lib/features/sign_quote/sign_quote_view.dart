import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/extensions/theme_extensions.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/app_colors.dart';
import '../../models/quote_model.dart';
import '../../services/quote_service.dart';
import 'widgets/signature_pad.dart';

class SignQuoteView extends StatefulWidget {
  final QuoteModel quote;

  const SignQuoteView({super.key, required this.quote});

  @override
  State<SignQuoteView> createState() => _SignQuoteViewState();
}

class _SignQuoteViewState extends State<SignQuoteView> {
  final QuoteService _quoteService = QuoteService();
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  bool _agreedToTerms = false;
  bool _hasDrawnSignature = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.quote.client.name);
    _titleController = TextEditingController(text: "Authorized Representative");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _onAcceptAndSign() {
    if (!_hasDrawnSignature) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please draw your signature above.")),
      );
      return;
    }
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept the terms and conditions.")),
      );
      return;
    }
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter signatory name.")),
      );
      return;
    }

    final dateStr = DateTime.now().toIso8601String().split('T').first;
    _quoteService.signQuote(widget.quote.id, _nameController.text.trim(), dateStr);

    final updated = widget.quote.copyWith(
      status: QuoteStatus.accepted,
      signatureName: _nameController.text.trim(),
      signatureDate: dateStr,
      isSigned: true,
    );

    context.pushReplacement(RoutesName.quoteSuccess, extra: updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Sign Estimate",
          style: context.text.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary card
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.quote.quoteNumber,
                          style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.darkBorder),
                        ),
                        Text(
                          '\$${widget.quote.total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                      ],
                    ),
                    6.vSpace,
                    Text(
                      widget.quote.projectName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'Prepared for: ${widget.quote.client.name} (${widget.quote.client.company})',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              20.vSpace,
              // Signatory details
              Text(
                "SIGNATORY DETAILS",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Colors.grey.shade600,
                ),
              ),
              10.vSpace,
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Legal Name",
                  prefixIcon: const Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              12.vSpace,
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Title / Designation",
                  prefixIcon: const Icon(Icons.work_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              20.vSpace,
              // Digital Drawing Canvas
              Text(
                "DRAW SIGNATURE",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: Colors.grey.shade600,
                ),
              ),
              8.vSpace,
              SignaturePad(
                onSignatureChanged: (hasSig) {
                  setState(() {
                    _hasDrawnSignature = hasSig;
                  });
                },
              ),
              16.vSpace,
              // Agreement Checkbox
              CheckboxListTile(
                value: _agreedToTerms,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "I confirm that I am authorized to accept this estimate on behalf of ${widget.quote.client.company} and agree to all terms and conditions stated.",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                ),
                onChanged: (val) {
                  setState(() {
                    _agreedToTerms = val ?? false;
                  });
                },
              ),
              24.vSpace,
              // Submit Button
              AppButton(
                text: "ACCEPT & SIGN ESTIMATE ✍️",
                backgroundColor: AppColors.darkBorder,
                textColor: Colors.white,
                onPressed: _onAcceptAndSign,
              ),
              16.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
