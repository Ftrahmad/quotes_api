import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../widgets/quote_list.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Quote> favorites; // Anggap ini diisi dari penyimpanan lokal

  const FavoritesScreen({Key? key, required this.favorites}) : super(key: key);

  void _shareQuote(Quote quote) {
    
  }

  void _toggleFavorite(Quote quote) {
   
  }

  void _showQuoteDetails(Quote quote) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kutipan Favorit'),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('Belum ada kutipan favorit'))
          : QuoteList(
              quotes: favorites,
              onTap: _showQuoteDetails,
            ),
    );
  }
}