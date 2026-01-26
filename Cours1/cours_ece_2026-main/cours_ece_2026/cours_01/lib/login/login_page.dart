import 'package:cours_01/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login in or sign up',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 12),
              EmailField(),
              const SizedBox(height: 16),
              ContinueButton(onPressed: () {}),
              const SizedBox(height: 24),
              const OrSeparator(),
              const SizedBox(height: 24),
              SocialButton(
                label: 'Apple',
                iconPath: 'assets/apple_logo.svg',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                label: 'Google',
                iconPath: 'assets/google_logo.svg',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                label: 'Facebook',
                iconPath: 'assets/facebook_logo.svg',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: 'Enter your email',
        hintStyle: TextStyle(color: AppColors.textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.inputFieldInactiveBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.inputFieldActiveBackground),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: AppColors.buttonPrimaryText,
        backgroundColor: AppColors.buttonPrimaryBackground,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text('Continue'),
    );
  }
}

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(child: Divider(color: AppColors.divider)),
        Text('Or', style: TextStyle(color: AppColors.textSecondary)),
        Expanded(child: Divider(color: AppColors.divider)),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.label, required this.iconPath, required this.onPressed, super.key,
  });

  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: AppColors.inputFieldInactiveBackground),
        foregroundColor: AppColors.textPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 12),
          Text('Continue with $label', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
