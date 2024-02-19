 import 'home_initial_params.dart';

class HomeState {
  final int currentIndex;
  final bool onlineStatus;
  final String? message;
  final String? errorMessage;
  final HomeInitialParams params;

  const HomeState(
      {required this.params,
        this.currentIndex = 0,
        this.onlineStatus = false,
        this.message,
        this.errorMessage});

  HomeState copyWith({
    int? currentIndex,
    bool? onlineStatus,
    String? message,
    String? errorMessage,
    HomeInitialParams? params,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      params: params ?? this.params,
    );
  }

  @override
  String toString() {
    return 'HomeState{navbarIndex: $currentIndex, onlineStatus: $onlineStatus, message: $message, errorMessage: $errorMessage, params: $params}';
  }
}
