// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'main_item_model.dart';

/// This class defines the variables used in the [main_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainModel extends Equatable {
  MainModel({this.mainItemList = const []}) {}

  List<MainItemModel> mainItemList;

  MainModel copyWith({List<MainItemModel>? mainItemList}) {
    return MainModel(
      mainItemList: mainItemList ?? this.mainItemList,
    );
  }

  @override
  List<Object?> get props => [mainItemList];
}
