import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_vectorial_images.dart';
import 'package:formation_flutter/screens/product_header_test_page.dart';
import 'package:provider/provider.dart';

// Reminder: The initial instructions mentioned creating a reusable widget
// for the social login button. For simplicity and to keep changes
// in one file as requested, it's implemented here directly.
// A good refactor would be to extract it.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Screen',
      theme: ThemeData(
        fontFamily: 'Avenir',
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductHeaderTestPage(),
    );
  }
}

// Using a StatefulWidget to manage the state of the email TextField.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // State variable to hold the email input
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a SafeArea to avoid UI overlapping with system elements
      body: SafeArea(
        // Padding for the entire screen
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email TextField
              TextField(
                onChanged: (value) {
                  // Update the state on every change
                  setState(() {
                    _email = value;
                  });
                },
                autofocus: false,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Votre adresse email',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: AppColors.inputFieldInactiveBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: AppColors.inputFieldActiveBackground),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // "Continue" Button
              FilledButton(
                // Button is disabled if email is empty
                onPressed: _email.isNotEmpty ? () {
                  // TODO: Implement login logic
                } : null,
                style: FilledButton.styleFrom(
                  foregroundColor: AppColors.buttonPrimaryText,
                  backgroundColor: AppColors.buttonPrimaryBackground,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Continue'),
              ),
              const SizedBox(height: 40.0),

              // "Or" Separator
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 40.0),

              // Social Login Buttons
              _buildSocialButton(
                text: 'Continuer avec Apple',
                // Using a placeholder icon as 'apple.svg' is not available
                iconPath: AppVectorialImages.appLogo, 
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              _buildSocialButton(
                text: 'Continuer avec Google',
                iconPath: AppVectorialImages.appLogo,
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              _buildSocialButton(
                text: 'Continuer avec Facebook',
                iconPath: AppVectorialImages.appLogo,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build social login buttons, as requested in the instructions
  Widget _buildSocialButton({
    required String text,
    required String iconPath,
    required VoidCallback onPressed,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColors.divider),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.0,
            height: 24.0,
          ),
          const SizedBox(width: 12.0),
          // Expanded ensures the text takes available space and alignment works
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}