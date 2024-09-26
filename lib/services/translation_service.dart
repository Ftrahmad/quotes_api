import 'package:translator/translator.dart';

class TranslationService {
  final GoogleTranslator translator = GoogleTranslator();

  Future<String> translateToIndonesian(String text) async {
    try {
      var translation = await translator.translate(text, to: 'id');
      return translation.text;
    } catch (e) {
      print('Error translating: $e');
      return 'Terjemahan tidak tersedia';
    }
  }
}