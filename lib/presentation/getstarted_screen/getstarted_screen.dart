import 'package:knee_osteoarthritis/widgets/custom_elevated_button.dart';
import 'models/getstarted_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';
import 'bloc/getstarted_bloc.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<GetstartedBloc>(
        create: (context) => GetstartedBloc(
            GetstartedState(getstartedModelObj: GetstartedModel()))
          ..add(GetstartedInitialEvent()),
        child: GetstartedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetstartedBloc, GetstartedState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: Container(
                  width: SizeUtils.width,
                  height: SizeUtils.height,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGroup20),
                          fit: BoxFit.cover)),
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 47.h, vertical: 33.v),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Spacer(), _buildGetStarted(context)]))),
              bottomNavigationBar: _buildGetStarted1(context)));
    });
  }

  /// Section Widget
  Widget _buildGetStarted(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_get_started".tr,
        buttonStyle: CustomButtonStyles.none,
        decoration:
            CustomButtonStyles.gradientPrimaryToPrimaryContainerDecoration);
  }

  /// Section Widget
  Widget _buildGetStarted1(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_get_started".tr,
        margin: EdgeInsets.only(left: 47.h, right: 47.h, bottom: 33.v),
        buttonStyle: CustomButtonStyles.none,
        decoration:
            CustomButtonStyles.gradientPrimaryToPrimaryContainerDecoration);
  }
}
