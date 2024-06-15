import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home/views/HomeView.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  void goToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  TextStyle _getTitleTextStyle(BuildContext context) {
    return GoogleFonts.lato(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.black,
    );
  }

  TextStyle _getSubtitleTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.black,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE490F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'images/Expenses.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              onLoaded: (composition) {
                Future.delayed(const Duration(seconds: 2), goToNextScreen);
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Expense Tracker',
              style: _getTitleTextStyle(context),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Get Financial habits in your control',
                style: _getSubtitleTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 140),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF320E8),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 180.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
