import 'package:ayol_uchun_project/core/routers/routes.dart';
import 'package:ayol_uchun_project/data/repository/auth_repositories.dart';
import 'package:ayol_uchun_project/features/auth/manager/auth_bloc.dart';
import 'package:ayol_uchun_project/features/auth/pages/login_page.dart';
import 'package:ayol_uchun_project/features/auth/pages/royxatdan_otish.dart';
import 'package:ayol_uchun_project/features/home_page/pages/home_page_view.dart';
import 'package:ayol_uchun_project/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.login,
navigatorKey: navigatorKey,
  routes:[
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    ),
    // GoRoute(
    //   path: Routes.courses,
    //   builder: (context, state) => RegisterPage(),
    // ),
  ]

);