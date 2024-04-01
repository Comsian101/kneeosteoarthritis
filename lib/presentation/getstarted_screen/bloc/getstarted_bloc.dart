import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:knee_osteoarthritis/presentation/getstarted_screen/models/getstarted_model.dart';
part 'getstarted_event.dart';
part 'getstarted_state.dart';

/// A bloc that manages the state of a Getstarted according to the event that is dispatched to it.
class GetstartedBloc extends Bloc<GetstartedEvent, GetstartedState> {
  GetstartedBloc(GetstartedState initialState) : super(initialState) {
    on<GetstartedInitialEvent>(_onInitialize);
  }

  _onInitialize(
    GetstartedInitialEvent event,
    Emitter<GetstartedState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}
