import 'package:flutter/material.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/getstarted_screen/getstarted_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/main_container_screen/main_container_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String getstartedScreen = '/getstarted_screen';

  static const String signupScreen = '/signup_screen';

  static const String mainContainerScreen = '/main_container_screen';

  static const String mainPage = '/main_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: LoginScreen.builder,
        getstartedScreen: GetstartedScreen.builder,
        signupScreen: SignupScreen.builder,
        mainContainerScreen: MainContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: GetstartedScreen.builder
      };
}
