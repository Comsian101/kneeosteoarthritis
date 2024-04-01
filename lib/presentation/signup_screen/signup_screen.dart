import 'package:knee_osteoarthritis/core/utils/validation_functions.dart';
import 'package:knee_osteoarthritis/widgets/custom_text_form_field.dart';
import 'package:knee_osteoarthritis/widgets/custom_icon_button.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';
import 'bloc/signup_bloc.dart';
import 'package:knee_osteoarthritis/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 117.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgVector1,
                                  height: 119.v,
                                  width: 188.h,
                                  alignment: Alignment.centerLeft),
                              SizedBox(height: 48.v),
                              Text("lbl_create_account".tr,
                                  style: theme.textTheme.headlineLarge),
                              SizedBox(height: 45.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 45.h),
                                  child: BlocSelector<SignupBloc, SignupState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.userNameController,
                                      builder: (context, userNameController) {
                                        return CustomTextFormField(
                                            controller: userNameController,
                                            hintText: "lbl_username".tr,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    14.h, 13.v, 3.h, 13.v),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgLock,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 50.v),
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "err_msg_please_enter_valid_text"
                                                    .tr;
                                              }
                                              return null;
                                            });
                                      })),
                              SizedBox(height: 42.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 45.h),
                                  child: BlocSelector<SignupBloc, SignupState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.passwordController,
                                      builder: (context, passwordController) {
                                        return CustomTextFormField(
                                            controller: passwordController,
                                            hintText: "lbl_password".tr,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    18.h, 14.v, 13.h, 14.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgLocation,
                                                    height: 17.v,
                                                    width: 14.h)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 50.v),
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidPassword(value,
                                                      isRequired: true))) {
                                                return "err_msg_please_enter_valid_password"
                                                    .tr;
                                              }
                                              return null;
                                            },
                                            obscureText: true);
                                      })),
                              SizedBox(height: 42.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 45.h),
                                  child: BlocSelector<SignupBloc, SignupState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.emailController,
                                      builder: (context, emailController) {
                                        return CustomTextFormField(
                                            controller: emailController,
                                            hintText: "lbl_e_mail".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    18.h, 19.v, 13.h, 19.v),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgEmail,
                                                    height: 11.v,
                                                    width: 14.h)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 50.v),
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidEmail(value,
                                                      isRequired: true))) {
                                                return "err_msg_please_enter_valid_email"
                                                    .tr;
                                              }
                                              return null;
                                            });
                                      })),
                              SizedBox(height: 42.v),
                              Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 45.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18.h, vertical: 14.v),
                                  decoration: AppDecoration.outlineBlack
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder25),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(2.h),
                                            decoration: AppDecoration.fillGray
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder3),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                      height: 12.v,
                                                      width: 10.h,
                                                      decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1.h))),
                                                  SizedBox(height: 2.v),
                                                  Container(
                                                      height: 2.adaptSize,
                                                      width: 2.adaptSize,
                                                      decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1.h)))
                                                ])),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 13.h, bottom: 2.v),
                                            child: Text("lbl_mobile".tr,
                                                style:
                                                    theme.textTheme.bodyMedium))
                                      ])),
                              SizedBox(height: 24.v),
                              _buildThirtySix(context)
                            ])))))));
  }

  /// Section Widget
  Widget _buildThirtySix(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 45.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: 362.v,
                  width: 148.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 56.h, vertical: 28.v),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGroup1),
                          fit: BoxFit.cover)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgFacebook,
                      height: 73.v,
                      width: 33.h,
                      alignment: Alignment.topLeft,
                      onTap: () {
                        onTapImgFacebook(context);
                      })),
              Padding(
                  padding:
                      EdgeInsets.only(left: 19.h, top: 28.v, bottom: 184.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 2.v),
                                      child: Text("lbl_create".tr,
                                          style:
                                              theme.textTheme.headlineSmall)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 13.h),
                                      child: CustomIconButton(
                                          height: 34.v,
                                          width: 56.h,
                                          padding: EdgeInsets.all(8.h),
                                          onTap: () {
                                            onTapBtnArrowLeft(context);
                                          },
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgArrowLeft)))
                                ])),
                        SizedBox(height: 26.v),
                        Text("lbl_or".tr,
                            style: CustomTextStyles.titleMediumLatoOnPrimary),
                        SizedBox(height: 22.v),
                        Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: CustomIconButton(
                                height: 47.adaptSize,
                                width: 47.adaptSize,
                                padding: EdgeInsets.all(7.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGoogle)))
                      ]))
            ])));
  }

  onTapImgFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapBtnArrowLeft(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
