import 'package:knee_osteoarthritis/presentation/main_page/main_page.dart';
import 'package:knee_osteoarthritis/widgets/custom_bottom_bar.dart';
import 'models/main_container_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';
import 'bloc/main_container_bloc.dart';

// ignore_for_file: must_be_immutable
class MainContainerScreen extends StatelessWidget {
  MainContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<MainContainerBloc>(
        create: (context) => MainContainerBloc(
            MainContainerState(mainContainerModelObj: MainContainerModel()))
          ..add(MainContainerInitialEvent()),
        child: MainContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainContainerBloc, MainContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.secondaryContainer,
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.mainPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Settings:
        return AppRoutes.mainPage;
      case BottomBarEnum.About:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.mainPage:
        return MainPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
