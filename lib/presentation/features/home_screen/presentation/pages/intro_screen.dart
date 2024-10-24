import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/screens/shows_screen.dart';
import 'dart:async'; // Add this import for Timer

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  Timer? _timer; // Timer for autoplay

  @override
  void initState() {
    super.initState();
    // Start autoplay timer
    startAutoPlay();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel(); // Cancel timer when disposing
    super.dispose();
  }

  void startAutoPlay() {
    // Cancel any existing timer
    _timer?.cancel();

    // Create new timer that advances page every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_controller.hasClients) {
        if (_controller.page?.round() == 3) {
          // If on last page, jump to first page
          _controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          // Advance to next page
          _controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  // Function to handle manual page changes
  void handlePageChange(int page) {
    setState(() {
      isLastPage = page == 3;
    });
    // Reset timer when page is manually changed
    startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: handlePageChange,
            children: [
              // First Intro Screen
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/6808efb5-1c1b-41f1-b167-8b3c87bc92a1/NTEfVBh8z1.json',
                        height: 300,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Discover Events',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Find amazing events happening around you',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Second Intro Screen
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/0633cd5b-1351-4492-905a-cb7f4d672aa1/IbvrV6E9QG.json',
                        height: 300,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Easy Booking',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Book tickets in just a few taps',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Third Intro Screen
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/0633cd5b-1351-4492-905a-cb7f4d672aa1/IbvrV6E9QG.json',
                        height: 300,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Enjoy Events',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Create memories with amazing experiences',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Fourth Intro Screen
              Container(
                color: Colors.teal,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/0633cd5b-1351-4492-905a-cb7f4d672aa1/IbvrV6E9QG.json',
                        height: 300,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Enjoy Events',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Create memories with amazing experiences',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Dot indicators and buttons
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(3);
                    _timer?.cancel(); // Cancel autoplay when skipping
                  },
                  child: const Text(
                    skip,
                    style: TextStyle(color: AppColors.background),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    spacing: 10,
                    dotColor: Colors.black26,
                    activeDotColor: AppColors.background,
                  ),
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                    startAutoPlay(); // Reset autoplay timer when dot is clicked
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      _timer?.cancel(); // Cancel autoplay before navigation
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowListScreen(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                      startAutoPlay(); // Reset autoplay timer when next is clicked
                    }
                  },
                  child: Text(
                    isLastPage ? done : next,
                    style: TextStyle(color: AppColors.background, fontSize: 17),
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
