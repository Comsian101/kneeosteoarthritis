import 'package:knee_osteoarthritis/widgets/app_bar/custom_app_bar.dart';
import 'package:knee_osteoarthritis/widgets/app_bar/appbar_title_image.dart';
import 'package:knee_osteoarthritis/widgets/app_bar/appbar_title.dart';
import 'package:knee_osteoarthritis/widgets/app_bar/appbar_subtitle.dart';
import 'package:knee_osteoarthritis/widgets/custom_search_view.dart';
import 'widgets/main_item_widget.dart';
import 'models/main_item_model.dart';
import 'models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';
import 'bloc/main_bloc.dart';

// ignore_for_file: must_be_immutable
class MainPage extends StatelessWidget {
  const MainPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(MainState(
        mainModelObj: MainModel(),
      ))
        ..add(MainInitialEvent()),
      child: MainPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.secondaryContainer,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillSecondaryContainer,
          child: Column(
            children: [
              _buildFortyOne(context),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.h,
                  vertical: 26.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    _buildMain(context),
                    SizedBox(height: 23.v),
                    _buildFour(context),
                    SizedBox(height: 16.v),
                    Text(
                      "msg_quick_excercises".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 5.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgGirlFitnessVe,
                      height: 134.v,
                      width: 216.h,
                      radius: BorderRadius.circular(
                        28.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyOne(BuildContext context) {
    return SizedBox(
      height: 228.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            title: Padding(
              padding: EdgeInsets.only(
                left: 26.h,
                top: 31.v,
                bottom: 87.v,
              ),
              child: Row(
                children: [
                  AppbarTitleImage(
                    imagePath: ImageConstant.imgLogo21,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.h,
                      top: 8.v,
                      bottom: 6.v,
                    ),
                    child: Column(
                      children: [
                        AppbarTitle(
                          text: "msg_knee_osteoarthritis".tr,
                          margin: EdgeInsets.only(right: 32.h),
                        ),
                        SizedBox(height: 4.v),
                        AppbarSubtitle(
                          text: "msg_lets_get_you_better".tr,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            styleType:
                Style.bgGradientnameprimaryopacity1nameprimaryContaineropacity1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocSelector<MainBloc, MainState, TextEditingController?>(
              selector: (state) => state.searchController,
              builder: (context, searchController) {
                return CustomSearchView(
                  width: 338.h,
                  controller: searchController,
                  hintText: "lbl_search".tr,
                  alignment: Alignment.bottomCenter,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMain(BuildContext context) {
    return SizedBox(
      height: 129.v,
      child: BlocSelector<MainBloc, MainState, MainModel?>(
        selector: (state) => state.mainModelObj,
        builder: (context, mainModelObj) {
          return ListView.separated(
            padding: EdgeInsets.only(right: 4.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 15.h,
              );
            },
            itemCount: mainModelObj?.mainItemList.length ?? 0,
            itemBuilder: (context, index) {
              MainItemModel model =
                  mainModelObj?.mainItemList[index] ?? MainItemModel();
              return MainItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(vertical: 15.v),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage2Traced,
            height: 69.adaptSize,
            width: 69.adaptSize,
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.v),
            child: Text(
              "msg_upload_pics_for".tr,
              style: CustomTextStyles.labelLargeBlack900,
            ),
          ),
        ],
      ),
    );
  }
}
