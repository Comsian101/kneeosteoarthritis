import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/main_item_model.dart';
import 'package:knee_osteoarthritis/presentation/main_page/models/main_model.dart';
part 'main_event.dart';
part 'main_state.dart';

/// A bloc that manages the state of a Main according to the event that is dispatched to it.
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(MainState initialState) : super(initialState) {
    on<MainInitialEvent>(_onInitialize);
  }

  List<MainItemModel> fillMainItemList() {
    return [
      MainItemModel(vector: ImageConstant.imgVector, exercises: "Exercises"),
      MainItemModel(vector: ImageConstant.imgIconChat, exercises: "Chatbot"),
      MainItemModel(exercises: "Library")
    ];
  }

  _onInitialize(
    MainInitialEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        mainModelObj: state.mainModelObj?.copyWith(
      mainItemList: fillMainItemList(),
    )));
  }
}
