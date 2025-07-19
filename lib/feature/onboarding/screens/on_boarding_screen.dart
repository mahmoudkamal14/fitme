import 'package:fitme/core/helper/utils/extentions.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:fitme/feature/onboarding/widgets/onboarding_footer_widget.dart';
import 'package:fitme/feature/onboarding/widgets/onboarding_header_widget.dart';
import 'package:fitme/feature/onboarding/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/onboarding_cubit.dart';
import '../logic/onboarding_state.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingCompleted) {
              context.navigateAndReplace(Routes.loginScreen);
            }
          },
          builder: (context, state) {
            final cubit = OnboardingCubit.get(context);
            if (state is OnboardingLoading) {
              return Center(
                child: CircularProgressIndicator(color: Color(0xFF6B7280)),
              );
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Column(
                  children: [
                    OnboardingHeaderWidget(),
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
                    SizedBox(height: 20.h),
                    OnboardingFooterWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
