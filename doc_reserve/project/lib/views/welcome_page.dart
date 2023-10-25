import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/viewmodels/welcome_viewmodel.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeViewModel viewModel = WelcomeViewModel();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showGetStartedButton = false;

  final List<String> images = [
    'assets/images/Welcome1.png',
    'assets/images/Welcome2.png',
    'assets/images/Welcome3.png',
  ];

  final List<String> descriptions = [
    'Welcome to Doctors Reservation App',
    'Find and book doctors easily',
    'Manage your appointments with ease',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 238, 192, 198)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                      if (_currentPage == images.length - 1) {
                        _showGetStartedButton = true;
                      } else {
                        _showGetStartedButton = false;
                      }
                    });
                  },
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            images[index],
                            height: 300,
                            width: 300,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              descriptions[index],
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 116, 92),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              SizedBox(height: 20),
              if (_showGetStartedButton)
                CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Get Started',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  color: Color.fromARGB(255, 29, 116, 92),
                  onPressed: () {
                    // Implementasi fungsi ketika tombol Get Started ditekan
                    viewModel.goToLoginPage(context);
                  },
                ),
              if (!_showGetStartedButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text(
                        'Skip',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          color: Color.fromARGB(255, 29, 116, 92),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _showGetStartedButton = true;
                        });
                      },
                    ),
                    CupertinoButton(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 18,
                          color: Color.fromARGB(255, 29, 116, 92),
                        ),
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color.fromARGB(255, 29, 116, 92) : Colors.grey,
      ),
    );
  }
}
