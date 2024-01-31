import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/product/global/service/connection_service.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState.initial()) {
    _connectivityService = ConnectivityService(this);
    on<GlobalConnectionSuccessEvent>(_globalConnectionHandler);
    on<GlobalNoConnectionEvent>(_globalNotConnectionHandler);
    _connectivityService.startListening();
  }
  late final ConnectivityService _connectivityService;

  Future<void> _globalConnectionHandler(
    GlobalConnectionSuccessEvent event,
    Emitter<GlobalState> emit,
  ) async =>
      emit(state.copyWith(isConnected: true));

  Future<void> _globalNotConnectionHandler(
    GlobalNoConnectionEvent event,
    Emitter<GlobalState> emit,
  ) async =>
      emit(state.copyWith(isConnected: false));

  @override
  Future<void> close() {
    _connectivityService.stopListening();
    return super.close();
  }
}
