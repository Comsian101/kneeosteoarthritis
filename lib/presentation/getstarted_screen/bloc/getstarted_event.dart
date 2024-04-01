// ignore_for_file: must_be_immutable

part of 'getstarted_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Getstarted widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class GetstartedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Getstarted widget is first created.
class GetstartedInitialEvent extends GetstartedEvent {
  @override
  List<Object?> get props => [];
}
