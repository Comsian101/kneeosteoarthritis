// ignore_for_file: must_be_immutable

part of 'main_bloc.dart';

/// Represents the state of Main in the application.
class MainState extends Equatable {
  MainState({
    this.searchController,
    this.mainModelObj,
  });

  TextEditingController? searchController;

  MainModel? mainModelObj;

  @override
  List<Object?> get props => [
        searchController,
        mainModelObj,
      ];

  MainState copyWith({
    TextEditingController? searchController,
    MainModel? mainModelObj,
  }) {
    return MainState(
      searchController: searchController ?? this.searchController,
      mainModelObj: mainModelObj ?? this.mainModelObj,
    );
  }
}
