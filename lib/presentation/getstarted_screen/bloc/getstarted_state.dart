// ignore_for_file: must_be_immutable

part of 'getstarted_bloc.dart';

/// Represents the state of Getstarted in the application.
class GetstartedState extends Equatable {
  GetstartedState({this.getstartedModelObj});

  GetstartedModel? getstartedModelObj;

  @override
  List<Object?> get props => [
        getstartedModelObj,
      ];

  GetstartedState copyWith({GetstartedModel? getstartedModelObj}) {
    return GetstartedState(
      getstartedModelObj: getstartedModelObj ?? this.getstartedModelObj,
    );
  }
}
