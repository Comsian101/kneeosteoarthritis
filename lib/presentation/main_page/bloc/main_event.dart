// ignore_for_file: must_be_immutable

part of 'main_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Main widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Main widget is first created.
class MainInitialEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}
