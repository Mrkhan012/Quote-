import 'package:get/get.dart';
import 'package:quote/models/quote_model.dart';
import 'package:quote/repository/quote_repo.dart';
class QuoteController extends GetxController {
  var quote = Quote(content: "Loading...", author: "").obs;
  var isLoading = false.obs;

  final QuoteService quoteService;

  QuoteController(this.quoteService);

  void fetchQuote() async {
    isLoading(true);
    try {
      var newQuote = await quoteService.fetchRandomQuote();
      quote.value = newQuote;
    } catch (e) {
      print("Error: $e"); // Debugging
      quote.value = Quote(content: "Failed to load quote", author: "Unknown");
    } finally {
      isLoading(false);
    }
  }
}
