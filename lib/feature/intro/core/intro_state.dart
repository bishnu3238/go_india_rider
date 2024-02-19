class IntroState {
  bool isLoading;
  bool isWaiting;
  double width;
  double height;

  IntroState(
      {this.isLoading = false,
      this.isWaiting = false,
      this.width = 1 / 10,
      this.height = 1 / 20});

  factory IntroState.init() => IntroState(isLoading: true, isWaiting: true);

  IntroState copyWith({
    bool? isWaiting,
    bool? isLoading,
    double? width,
    double? height,
  }) =>
      IntroState(
        isLoading: isLoading ?? this.isLoading,
        isWaiting: isWaiting ?? this.isWaiting,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  @override
  String toString() =>
      'IntroState{isLoading: $isLoading, isWaiting: $isWaiting, width: $width, height: $height}';
}
