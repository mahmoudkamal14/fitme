abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int index;

  OnboardingPageChanged(this.index);
}

class OnboardingCompleting extends OnboardingState {}

class OnboardingCompleted extends OnboardingState {}

class OnboardingError extends OnboardingState {
  final String message;

  OnboardingError(this.message);
}
