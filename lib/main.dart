import 'package:ayol_uchun_project/core/client.dart';
import 'package:ayol_uchun_project/core/routers/router.dart';
import 'package:ayol_uchun_project/core/routers/routes.dart';
import 'package:ayol_uchun_project/data/repository/auth_repositories.dart';
import 'package:ayol_uchun_project/data/repository/home_repository.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_bloc.dart';
import 'package:ayol_uchun_project/features/home_page/manager/home_bloc.dart';
import 'package:ayol_uchun_project/features/home_page/pages/home_page_view.dart';
import 'package:ayol_uchun_project/features/auth/widgets/confirmation.dart';
import 'package:ayol_uchun_project/features/auth/widgets/parol_tasdiq.dart';
import 'package:flutter/material.dart';
import 'package:ayol_uchun_project/features/auth/pages/royxatdan_otish.dart';
import 'package:ayol_uchun_project/features/auth/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/widgets/phone_entry.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(repository: AuthRepository(client: ApiClient(),),),),
        BlocProvider(create: (context) => HomeBloc(repository: HomeRepository(client: ApiClient())),)
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    routerConfig: router,
    );
  }
}


final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiJub3ppbWExIiwianRpIjoiMDFmZmM1NWItNGE2OS00YTNmLWJmZmUtMmI2YjI3MzE3N2FlIiwidXNlcmlkIjoiMyIsImV4cCI6MTg0Mzc0NDY3OSwiaXNzIjoibG9jYWxob3N0IiwiYXVkIjoiYXVkaWVuY2UifQ.FEHk0Gax4OZzkAKtV5GgZeWPMiFWWF8C-YP2VBAdwjc';

