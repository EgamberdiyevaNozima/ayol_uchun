import 'package:ayol_uchun_project/features/auth/pages/login_page.dart';
import 'package:ayol_uchun_project/features/auth/widgets/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/royxatdan_otish.dart';

class ParolTasdiq extends StatelessWidget {
  ParolTasdiq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Xush kelibsiz!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "O‘quv platformasiga kirish uchun quyida berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.black54),
                            hintText: 'Parol',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.black54),
                            hintText: 'Parolni tasdiqlash',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: 400),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE84266),
                          padding:  EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize:  Size(double.infinity, 0),
                        ),
                        onPressed: () {},
                        child:  Text(
                          'Kirish',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side:  BorderSide(color: Colors.white),
                          foregroundColor: Colors.white,
                          padding:  EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize:  Size(double.infinity, 0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  Confirmation(),
                            ),
                          );
                        },
                        // onPressed: () {
                        //   Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (_) => ParolTasdiq()),
                        //   );
                        // },

                        child:  Text("Ro'yxatdan o'tish"),
                      ),
                      SizedBox(height: 12),
                    ],
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
