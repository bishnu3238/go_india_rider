import 'package:package/package.dart';

class ApplicationState {
  final bool isFirstTimeInstall;
  final bool isPermissionGranted;
  final bool isLoading;

  const ApplicationState(
      {this.isLoading = true,
      this.isFirstTimeInstall = true,
      this.isPermissionGranted = false});

  @override
  String toString() =>
      'AppState{isFirstTimeInstall: $isFirstTimeInstall, isLoading: $isLoading}';

  ApplicationState copyWith({
    bool? isLoading,
    bool? isFirstTimeInstall,
    bool? isPermissionGranted,
  }) =>
      ApplicationState(
        isLoading: isLoading ?? this.isLoading,
        isFirstTimeInstall: isFirstTimeInstall ?? this.isFirstTimeInstall,
        isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
      );

  Map<String, dynamic> toMap() => {
        'isFirstTimeInstall': isFirstTimeInstall.toString(),
        'isPermissionGranted': isPermissionGranted.toString()
      };

  factory ApplicationState.fromMap(Map<String, dynamic> map) => ApplicationState(
        isFirstTimeInstall: (map['isFirstTimeInstall'] as Object?).toBull,
        isPermissionGranted: (map['isPermissionGranted'] as Object?).toBull,
      );
}
