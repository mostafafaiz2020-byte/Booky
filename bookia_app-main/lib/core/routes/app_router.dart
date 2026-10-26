import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/ui/login_screen.dart';
import 'package:bookia/features/auth/presentation/ui/register_screen.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            );
          },
        );
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: RegisterScreen(),
            );
          },
        );
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => HomeCubit()..getBestSellerBooks(),
              child: HomeScreen(),
            );
          },
        );
    }
  }
}
