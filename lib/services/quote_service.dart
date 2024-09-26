import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';
import '../utils/constants.dart';
import 'translation_service.dart';

class QuoteService {
  final TranslationService _translationService = TranslationService();

  Future<Quote> getRandomQuote() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/quotes'),
        headers: {'X-Api-Key': API_KEY},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          Quote quote = Quote.fromJson(data[0]);
          
          // Translate content and author
          quote.translatedContent = await _translationService.translateToIndonesian(quote.content);
          quote.translatedAuthor = await _translationService.translateToIndonesian(quote.author);
          
          return quote;
        } else {
          throw Exception('Tidak ada kutipan yang tersedia');
        }
      } else {
        throw Exception('Gagal memuat kutipan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getRandomQuote: $e');
      throw Exception('Gagal memuat kutipan: $e');
    }
  }
}