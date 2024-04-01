import '../../../core/app_export.dart';

/// This class is used in the [main_item_widget] screen.
class MainItemModel {
  MainItemModel({
    this.vector,
    this.exercises,
    this.id,
  }) {
    vector = vector ?? ImageConstant.imgVector;
    exercises = exercises ?? "Exercises";
    id = id ?? "";
  }

  String? vector;

  String? exercises;

  String? id;
}
