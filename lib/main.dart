import 'package:flutter/material.dart';
import 'package:pretium_test/constants.dart';
import 'package:pretium_test/core/assets.dart';
import 'package:pretium_test/router.dart';
import 'package:pretium_test/utils/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', '')],
      path: Assets.translations,
      fallbackLocale: const Locale('en', ''),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.splash,
    );
  }
}
