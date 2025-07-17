
import 'package:fitme/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/onborading_model.dart';
import '../services/services.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<onboardingState> {
  final OnboardingService _service = OnboardingService();
  final PageController _pageController = PageController();

  List<OnboardingModel> onboardingItems = [];
  int currentIndex = 0;
  bool isCompleting = false;

  OnboardingCubit() : super(OnboardingInitial()) {
    _initializeData();
  }

  static OnboardingCubit get(context) => BlocProvider.of(context);

  PageController get pageController => _pageController;

  bool get isLastPage => currentIndex == onboardingItems.length - 1;

  void _initializeData() {
    emit(OnboardingLoading());
    onboardingItems = _service.getOnboardingData();
    emit(OnboardingLoaded());
  }

  void onPageChanged(int index) {
    currentIndex = index;
    emit(OnboardingPageChanged(index));
  }

  void nextPage() {
    if (currentIndex < onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLastPage() {
    _pageController.animateToPage(
      onboardingItems.length - 1,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> completeOnboarding() async {
    isCompleting = true;
    emit(OnboardingCompleting());
    try {
      await _service.completeOnboarding();
      emit(OnboardingCompleted());
    } catch (e) {
      emit(OnboardingError('Error completing onboarding: $e'));
    } finally {
      isCompleting = false;
    }
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}