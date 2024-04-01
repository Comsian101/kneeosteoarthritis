// ignore_for_file: must_be_immutable

part of 'main_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MainContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MainContainerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the MainContainer widget is first created.
class MainContainerInitialEvent extends MainContainerEvent {
  @override
  List<Object?> get props => [];
}
