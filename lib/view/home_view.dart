import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote/controller/quote_controller.dart';
import 'package:quote/repository/quote_repo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
final QuoteController quoteController = Get.put(QuoteController(QuoteService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display loading indicator if fetching
                Obx(() {
                  if (quoteController.isLoading.value) {
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  }
                  return Text(
                    '"${quoteController.quote.value.content}"',
                    style: GoogleFonts.lora(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return Text(
                    '- ${quoteController.quote.value.author}',
                    style: GoogleFonts.lora(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    quoteController.fetchQuote();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Fetch Quote',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));}}