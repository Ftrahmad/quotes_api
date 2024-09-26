import 'package:flutter/material.dart';
import '../models/quote.dart';
import 'quote_card.dart';

class QuoteList extends StatelessWidget {
  final List<Quote> quotes;
  final Function(Quote)? onTap;

  const QuoteList({
    Key? key,
    required this.quotes,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return GestureDetector(
          onTap: onTap != null ? () => onTap!(quote) : null,
          child: QuoteCard(
            quote: quote,
          ),
        );
      },
    );
  }
}