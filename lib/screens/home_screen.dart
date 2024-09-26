import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuoteService _quoteService = QuoteService();
  Quote? _currentQuote;

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  Future<void> _loadQuote() async {
    try {
      final quote = await _quoteService.getRandomQuote();
      setState(() {
        _currentQuote = quote;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat kutipan')),
      );
    }
  }

  void _shareQuote() {
    
  }

  void _favoriteQuote() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kutipan Harian'),
      ),
      body: Center(
        child: _currentQuote == null
            ? CircularProgressIndicator()
            : QuoteCard(
                quote: _currentQuote!,
                
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadQuote,
        child: Icon(Icons.refresh),
      ),
    );
  }
}