part of 'global_bloc.dart';

class GlobalState extends Equatable {
  const GlobalState({
    required this.isConnected,
  });

  factory GlobalState.initial() {
    return const GlobalState(isConnected: false);
  }

  final bool isConnected;

  @override
  List<Object?> get props => [isConnected];

  GlobalState copyWith({
    bool? isConnected,
  }) {
    return GlobalState(
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
