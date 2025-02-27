import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quote/models/quote_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<Quote> fetchRandomQuote() async {
    try {
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      final request = await client.getUrl(Uri.parse('https://api.quotable.io/random'));
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final data = jsonDecode(responseBody);
        return Quote.fromJson(data);
      } else {
        throw Exception("Failed to load quote");
      }
    } catch (e) {
      print("Error fetching quote: $e");
      return Quote(content: "Failed to load quote", author: "Unknown");
    }
  }
}
