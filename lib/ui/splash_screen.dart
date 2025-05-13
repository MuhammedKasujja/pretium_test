import 'package:flutter/material.dart';
import 'package:pretium_test/constants.dart';
import 'package:pretium_test/core/assets.dart';
import 'package:pretium_test/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(Assets.appIcon, height: 80),
                const SizedBox(height: 20),
                const Text(
                  kAppName,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
