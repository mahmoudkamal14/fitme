abstract class onboardingState {}

class OnboardingInitial extends onboardingState {}

class OnboardingLoading extends onboardingState {}

class OnboardingLoaded extends onboardingState {}

class OnboardingPageChanged extends onboardingState {
final int index;

OnboardingPageChanged(this.index);
}

class OnboardingCompleting extends onboardingState {}

class OnboardingCompleted extends onboardingState {}

class OnboardingError extends onboardingState {
final String message;

OnboardingError(this.message);
}