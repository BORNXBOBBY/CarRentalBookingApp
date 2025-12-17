import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/assets.dart';
import '../routing/app_pages.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_shapes.dart';
import 'login_screen.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int currentIndex = 0;

  final List<Map<String, String>> onboard = [
    {
      "image": Assets.onboard3,
      "title": 'Find Your Perfect Ride',
      "subtitle":
      'From premium sedans to rugged SUVs, we have the perfect car for every occasion. Choose your favorite car today.',
    },
    {
      "image": Assets.onboard3,
      "title": 'Fast & Flexible Booking',
      "subtitle":
      'Renting a car is now incredibly easy. Just select your dates, choose your location, and confirm your ride in just a few seconds.',
    },
    {
      "image": Assets.onboard3,
      "title": 'Safe & Insured Journeys',
      "subtitle":
      'All our cars are fully insured and well maintained. Enjoy your trip without any worries, because your safety is our priority.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboard.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      child: ClipPath(
                        clipper: OnboardCardClipper(),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            onboard[index]['image']!,
                            height:
                            MediaQuery.of(context).size.height / 1.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              onboard[index]['title']!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              onboard[index]['subtitle']!,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboard.length,
                  (idx) => Container(
                margin: const EdgeInsets.all(4),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color:
                  currentIndex == idx ? const Color(0xF7FF8900) : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16), // was AppTheme.verticalSpacing(mul: 2)

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedBtn(
                onPressed: () {
                  if (currentIndex == onboard.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    );
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                text: 'Get Started',
                isBigSize: true,
              ),
            ),
          ),


          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
