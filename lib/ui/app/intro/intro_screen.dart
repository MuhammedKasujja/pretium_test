import 'package:flutter/material.dart';
import 'package:pretium_test/core/radius.dart';
import 'package:pretium_test/core/spacing.dart';
import 'package:pretium_test/router.dart';
import 'package:pretium_test/ui/app/buttons/elevated_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<IntroDataItem> introData = [
    IntroDataItem(
      title: 'Direct Pay',
      description: 'Pay with crypto across Africa effortlessly',
      icon: Icons.card_giftcard,
    ),
    IntroDataItem(
      title: 'Accept Payments',
      description: 'Accept stablecoin payments hassle-free',
      icon: Icons.account_balance_wallet,
    ),
    IntroDataItem(
      title: 'Pay Bills',
      description: 'Pay for utility services and earn rewards',
      icon: Icons.receipt,
    ),
  ];

  void _onDone() {
    Navigator.of(context).pushReplacementNamed(AppRouter.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _controller,
                      itemCount: introData.length,
                      onPageChanged:
                          (index) => setState(() => _currentPage = index),
                      itemBuilder: (context, index) {
                        final data = introData[index];
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    DesignSystemRadius.full,
                                  ),
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                                child: Icon(
                                  data.icon,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 56,
                                ),
                              ),
                              SizedBox(height: 35),
                              Text(
                                data.title,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 20),
                              Text(
                                data.description,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: _onDone,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      introData.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 20 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape:
                              _currentPage == index
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                          color:
                              _currentPage == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).secondaryHeaderColor,
                          borderRadius:
                              _currentPage == index
                                  ? BorderRadius.circular(
                                    DesignSystemRadius.full,
                                  )
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: DesignSystemSpacing.m),
                  AppButton(
                    label:
                        _currentPage == introData.length - 1
                            ? 'Get Started'
                            : 'Next',
                    onPressed: () {
                      if (_currentPage == introData.length - 1) {
                        _onDone();
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroDataItem {
  final String title;
  final String description;
  final IconData icon;

  IntroDataItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
