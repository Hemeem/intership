import 'package:flutter/material.dart';
import 'package:internship/widgets/onboard/dot_indicator.dart';
import 'package:internship/widgets/onboard/onboard_page.dart';
import 'login_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageContent() {
    return [
      OnboardPage(
        image: 'assets/images/logo_pln.png',
        title: 'Selamat Datang Di Aplikasi Internship PLN Batam',
        description:
            'Standard dummy text ever since the type the leap into electronic typesetting.',
        bgColor: Color(0xFF80C1C8),
      ),
      OnboardPage(
        image: 'assets/images/absensi.png',
        title: 'Absensi Online',
        description:
            'Standard dummy text ever since the type the leap into electronic typesetting.',
        bgColor: Colors.orange,
      ),
      OnboardPage(
        image: 'assets/images/logbook.png',
        title: 'Pengisian Logbook Online',
        description:
            'Standard dummy text ever since the type the leap into electronic typesetting.',
        bgColor: Colors.indigo,
      ),
      OnboardPage(
        image: 'assets/images/perizinan.png',
        title: 'Pengajuan Perizinan Online',
        description:
            'Standard dummy text ever since the type the leap into electronic typesetting.',
        bgColor: Color(0xFF80C1C8),
      ),
    ];
  }

  void _onNextPressed() {
    if (_currentPage < _buildPageContent().length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  void _onSkipPressed() {
    _pageController.jumpToPage(_buildPageContent().length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _buildPageContent().length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildPageContent()[index];
            },
          ),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Indikator halaman
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _buildPageContent().length,
                    (index) => DotIndicator(isActive: index == _currentPage),
                  ),
                ),
                SizedBox(height: 20),
                // Tombol Skip dan Next
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol Skip
                      TextButton(
                        onPressed: _onSkipPressed,
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      // Tombol Next atau Get Started
                      TextButton(
                        onPressed: _onNextPressed,
                        child: Text(
                          _currentPage == _buildPageContent().length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: TextStyle(
                            color: Color(0xFF80C1C8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
