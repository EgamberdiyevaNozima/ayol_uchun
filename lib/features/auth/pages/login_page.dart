import 'package:ayol_uchun_project/core/routers/routes.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_bloc.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_event.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_state.dart';
import 'package:ayol_uchun_project/features/auth/widgets/google_apple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Siz muvaffaqiyatli kirdingiz")),
                  );
                  // Masalan, kirishdan keyin boshqa sahifaga yo'naltirish:
                  // context.go(Routes.home);
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        const Text(
                          'Xush kelibsiz!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            "O'quv platformasiga kirish uchun quyida elektron pochtangiz va parolingizni kiriting",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        // const Spacer(),
                        const Text(
                          "Kirish",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Phone field
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: phoneNumberController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                                    hintText: '+998',
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                        
                              // Password field
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordController,  // Bu yerda passwordController bo'lishi kerak edi
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                    Icon(Icons.lock_outline, color: Colors.black),
                                    suffixIcon:
                                    Icon(Icons.visibility_off, color: Colors.black54),
                                    hintText: 'Parol',
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Parolni unutdingizmi',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 150),
                              const Divider(color: Colors.white70),
                              const Text(
                                'Quyidagilar orqali kirish',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 12),
                              const GoogleApple(),
                              const SizedBox(height: 20),
                        
                              // Kirish Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE84266),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: const Size(double.infinity, 0),
                                ),
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                    AuthLogin(
                                      login: phoneNumberController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Siz muvaffaqiyatli kirdingiz")),
                                  );
                                  context.go(Routes.home);
                                },
                                child: state is AuthLoading
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(
                                  'Kirish',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 12),
                        
                              // Ro'yxatdan o'tish
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: const Size(double.infinity, 0),
                                ),
                                onPressed: () {
                                  context.go(Routes.register);
                                },
                                child: const Text("Ro’yxatdan o’tish"),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
