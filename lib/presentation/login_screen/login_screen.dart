import 'package:knee_osteoarthritis/core/utils/validation_functions.dart';
import 'package:knee_osteoarthritis/widgets/custom_text_form_field.dart';
import 'package:knee_osteoarthritis/widgets/custom_icon_button.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
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
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVector1,
                    height: 119.v,
                    width: 390.h,
                  ),
                  SizedBox(height: 25.v),
                  Text(
                    "lbl_hello".tr,
                    style: theme.textTheme.displayLarge,
                  ),
                  SizedBox(height: 26.v),
                  Text(
                    "msg_sign_in_to_your".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 42.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.h),
                    child: BlocSelector<LoginBloc, LoginState,
                        TextEditingController?>(
                      selector: (state) => state.userNameController,
                      builder: (context, userNameController) {
                        return CustomTextFormField(
                          controller: userNameController,
                          hintText: "lbl_username".tr,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(14.h, 13.v, 3.h, 13.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLock,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 50.v,
                          ),
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 41.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.h),
                    child: BlocSelector<LoginBloc, LoginState,
                        TextEditingController?>(
                      selector: (state) => state.passwordController,
                      builder: (context, passwordController) {
                        return CustomTextFormField(
                          controller: passwordController,
                          hintText: "lbl_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(18.h, 14.v, 13.h, 14.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLocation,
                              height: 17.v,
                              width: 14.h,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 50.v,
                          ),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: true,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 35.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 45.h),
                      child: Text(
                        "msg_forgot_your_password".tr,
                        style: CustomTextStyles.bodyMediumGray40001,
                      ),
                    ),
                  ),
                  SizedBox(height: 65.v),
                  _buildTwentySeven(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentySeven(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 45.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVector2,
              height: 305.v,
              width: 94.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 54.v,
                  bottom: 101.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.v),
                            child: Text(
                              "lbl_sign_in".tr,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 13.h),
                            child: CustomIconButton(
                              height: 34.v,
                              width: 56.h,
                              padding: EdgeInsets.all(8.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 97.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_don_t_have_an_account2".tr,
                            style: CustomTextStyles.bodyMediumff262626,
                          ),
                          TextSpan(
                            text: "lbl_create".tr,
                            style: CustomTextStyles.bodyMediumff262626.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
