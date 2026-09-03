import 'package:flutter/material.dart';
import '../../models/quote_model.dart';
import '../new_quote/new_quote_view.dart';

class EditQuoteView extends StatelessWidget {
  final QuoteModel quote;

  const EditQuoteView({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return NewQuoteView(initialQuote: quote);
  }
}
