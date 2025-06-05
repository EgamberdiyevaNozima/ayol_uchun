import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Tizimga kirish orqali siz ",
        style: TextStyle(color: Colors.white70, fontSize: 12),
        children: [
          TextSpan(
            text: "foydalanish shartlari ",
            style: TextStyle(color: Colors.pinkAccent),
          ),
          TextSpan(text: "va "),
          TextSpan(
            text: "maxfiylik siyosati",
            style: TextStyle(color: Colors.pinkAccent),
          ),
          TextSpan(text: "ga roziligingizni tasdiqlaysiz"),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
