import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:knee_osteoarthritis/presentation/main_container_screen/models/main_container_model.dart';
part 'main_container_event.dart';
part 'main_container_state.dart';

/// A bloc that manages the state of a MainContainer according to the event that is dispatched to it.
class MainContainerBloc extends Bloc<MainContainerEvent, MainContainerState> {
  MainContainerBloc(MainContainerState initialState) : super(initialState) {
    on<MainContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MainContainerInitialEvent event,
    Emitter<MainContainerState> emit,
  ) async {}
}
