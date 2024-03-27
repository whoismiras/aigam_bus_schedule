import 'package:bus_schedule/core/config/theme.dart';
import 'package:bus_schedule/core/widgets/app_outline_button_widget.dart';
import 'package:bus_schedule/features/main_page/presentation/ui/main_page.dart';
import 'package:flutter/material.dart';

/// Authorization Screen
class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppOutlineButtonWidget(
            text: 'Get Started',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
            },
          ),
          const AppOutlineButtonWidget(
            text: 'Terms and Conditions',
            url: 'https://aigam.ru',
          ),
          const AppOutlineButtonWidget(
            text: 'Privacy Policy',
            url: 'https://pub.dev',
          ),
          const SizedBox(height: 40),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImage.background),
        ],
      ),
    );
  }
}
