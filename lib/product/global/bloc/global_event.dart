part of 'global_bloc.dart';

sealed class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class GlobalConnectionSuccessEvent extends GlobalEvent {
  const GlobalConnectionSuccessEvent();
}

class GlobalNoConnectionEvent extends GlobalEvent {
  const GlobalNoConnectionEvent();
}
