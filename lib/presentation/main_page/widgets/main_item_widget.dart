import '../models/main_item_model.dart';
import 'package:flutter/material.dart';
import 'package:knee_osteoarthritis/core/app_export.dart';

// ignore: must_be_immutable
class MainItemWidget extends StatelessWidget {
  MainItemWidget(
    this.mainItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MainItemModel mainItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            Container(
              height: 102.adaptSize,
              width: 102.adaptSize,
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 39.v,
              ),
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomImageView(
                imagePath: mainItemModelObj?.vector,
                height: 23.v,
                width: 40.h,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              mainItemModelObj.exercises!,
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
