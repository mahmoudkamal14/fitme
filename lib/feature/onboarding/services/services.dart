import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/cache/cache_helper_key.dart';
import 'package:flutter/material.dart';

import '../model/onborading_model.dart';

class OnboardingService {
  static final OnboardingService _instance = OnboardingService._internal();
  factory OnboardingService() => _instance;
  OnboardingService._internal();

  List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: "Find the best\nfashion style for you",
        description:
            "Get ex clusive limited apparel that only you have! Made by famous brands.",
        imagePath: "assets/images/onboarding_one.jpg",
        backgroundColor: Colors.white,
      ),
      OnboardingModel(
        title: "Define yourself in\nyour unique way",
        description:
            "Get exclusive limited apparel that only you have! Made by famous brands.",
        imagePath: "assets/images/onboardingtwo.jpg",
        backgroundColor: Colors.white,
      ),
      OnboardingModel(
        title: "Start discover your\nunique fashion style",
        description:
            "Get exclusive limited apparel that only you have! Made by famous brands.",
        imagePath: "assets/images/onboardingthree.jpg",
        backgroundColor: Colors.white,
      ),
    ];
  }

  Future<void> completeOnboarding() async {
    await Future.delayed(Duration(milliseconds: 500));
    await CacheHelper().saveData(key: CacheHelperKey.isOnBoarding, value: true);
  }

  Future<bool> isOnboardingCompleted() async {
    return await CacheHelper().getData(key: CacheHelperKey.isOnBoarding) ??
        false;
  }
}
