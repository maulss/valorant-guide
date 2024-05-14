import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService extends ChangeNotifier {
  final Gemini gemini = Gemini.instance;
  String? _generatedGemini;
  String? get generatedGemini => _generatedGemini;

  final List<String> _responseParts = [];
  List<String> get responseParts => _responseParts;

  void sendMessage(String text) async {
    try {
      String question =
          "Analisis video gameplay Valorant dari tautan ini: $text. Berikan keunggulan, kelemahan, hasil analisis (hero yang digunakan, skor akhir, dan performa), serta saran gameplay yang baik.";
      await gemini.streamGenerateContent(question).listen(
        (event) {
          String? partText = event.content?.parts?.map((e) => e.text).join();
          if (partText != null) {
            _responseParts.add(partText);
          }

          _generatedGemini = _responseParts.join().replaceAll('*', '');
          notifyListeners();
        },
        onError: (error) {
          print('Error: $error');
        },
      );
    } catch (e) {
      print('Unexpected error: $e');
    }
    notifyListeners();
  }
}
