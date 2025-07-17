import 'package:fitme/feature/onboarding/widgets/onboarding_footer_widget.dart';
import 'package:fitme/feature/onboarding/widgets/onboarding_header_widget.dart';
import 'package:fitme/feature/onboarding/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/onboarding_cubit.dart';
import '../logic/onboarding_state.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8FA), // Match original background color
        body: BlocBuilder<OnboardingCubit, onboardingState>(
          builder: (context, state) {
            final cubit = OnboardingCubit.get(context);
            if (state is OnboardingLoading) {
              return Center(
                child: CircularProgressIndicator(color: Color(0xFF6B7280)),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  // Header
                  OnboardingHeaderWidget(),
                  // Page View Content
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: cubit.onPageChanged,
                      itemCount: cubit.onboardingItems.length,
                      itemBuilder: (context, index) {
                        return OnboardingPageWidget(
                          model: cubit.onboardingItems[index],
                          pageIndex: index,
                        );
                      },
                    ),
                  ),

                  // Bottom section
                  OnboardingFooterWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
