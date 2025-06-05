import 'dart:developer';

import 'package:ayol_uchun_project/core/routers/routes.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_bloc.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_event.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_state.dart';
import 'package:ayol_uchun_project/features/auth/widgets/google_apple.dart';
import 'package:ayol_uchun_project/features/auth/widgets/privacy_policy.dart';
import 'package:ayol_uchun_project/main.dart'; // navigatorKey uchun
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController firstController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    firstController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // BlocListener butun sahifa uchun yon ta'sirlarni (navigatsiya, snackbar) boshqaradi
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          log("xato");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthSuccess) {
          // Navigatsiyani shu yerda bajaramiz
          // `navigatorKey.currentContext` null bo'lmasligiga ishonch hosil qiling
          // yoki context.go dan foydalaning agar router shu contextda mavjud bo'lsa
          if (navigatorKey.currentContext != null) {
            navigatorKey.currentContext!.go(Routes.login);
          } else {
            // Fallback yoki xatolikni qayd etish
            log("NavigatorKey currentContext is null during navigation");
            // context.go(Routes.login); // Agar bu contextda router mavjud bo'lsa
          }
        }
      },
      // BlocBuilder UI qismlarini (masalan, yuklanish indikatori) BLoC holatiga qarab qayta quradi
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // Asosiy Scaffold
          return Scaffold(
            body: Stack(
              children: [
                // Orqa fon rasmi
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Asosiy kontent (aylantiriladigan)
                SingleChildScrollView(
                  child: Padding( // Kichik padding qo'shdim, umumiy ko'rinish uchun
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 60), //SafeArea yo'qligi uchun tepadan biroz joy
                        const Text(
                          'Xush kelibsiz!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "O‘quv platformasiga kirish uchun quyida berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          'Ro’yxatdan o’tish',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              buildInput(Icons.person, "Ism", firstController),
                              const SizedBox(height: 12),
                              buildInput(Icons.person_outline, "Familiya", lastNameController),
                              const SizedBox(height: 12),
                              buildInput(Icons.email_outlined, "Elektron pochta", emailController),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        const Divider(color: Colors.white24, indent: 40, endIndent: 40),
                        const SizedBox(height: 8),
                        const Text(
                          'Quyidagilar orqali kirish',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 16),
                        const GoogleApple(),
                        const SizedBox(height: 150),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const PrivacyPolicy(),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE84266),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: const Size(double.infinity, 0),
                                ),
                                onPressed: (state is AuthLoading) ? null : () { // Agar yuklanayotgan bo'lsa, tugmani o'chirish
                                  if (firstController.text.trim().isEmpty ||
                                      lastNameController.text.trim().isEmpty ||
                                      emailController.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Iltimos, barcha maydonlarni to'ldiring."),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<AuthBloc>().add(
                                    AuthRegister(
                                      firstName: firstController.text.trim(),
                                      lastName: lastNameController.text.trim(),
                                      email: emailController.text.trim(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Siz muvaffaqqiyatli ro'yxatdan o'tdingiz")));
                                  context.go(Routes.home);
                                },
                                child: const Text(
                                  'Davom etish',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                if (state is AuthLoading)

                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInput(IconData icon, String hint, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}