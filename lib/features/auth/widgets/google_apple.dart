import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleApple extends StatelessWidget {
  const GoogleApple({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/google.svg',
                height: 20,
              ),
              label: Text('Google'),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/apple.svg',
                height: 20,
              ),
              label: Text('Apple'),
            ),
          ),
        ],
      ),
    );
  }
}
