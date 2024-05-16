import 'package:flutter/material.dart';
import 'package:travelkit_app/pages/home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A89A5),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Travel light with a convenient packing list',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Our mobile app will help you quickly and easily gather everything you need for your trip.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: const Color(0xFFF5F5F5).withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 36, 0, 56),
            child: Image.asset('assets/onboarding.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Text(
            'Terms of Use / Privacy Policy',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'SF Pro Text',
                color: const Color(0xFFF5F5F5).withOpacity(0.4),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ]),
      ),
    );
  }
}
