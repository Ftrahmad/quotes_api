import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteDetailScreen extends StatelessWidget {
  final Quote quote;
  final Function(Quote) onShare;
  final Function(Quote) onToggleFavorite;
  final bool isFavorite;

  const QuoteDetailScreen({
    Key? key,
    required this.quote,
    required this.onShare,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kutipan'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.content,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- ${quote.author}',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 32),
            Text(
              'Terjemahan:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              quote.translatedContent ?? 'Terjemahan tidak tersedia',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              '- ${quote.translatedAuthor ?? quote.author}',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 32),
            // ... (rest of the existing code)
          ],
        ),
      ),
    );
  }
}