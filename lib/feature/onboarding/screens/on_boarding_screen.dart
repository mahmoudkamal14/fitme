import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/OnboardingCubit.dart';
import '../logic/onboarding_state.dart';
import '../model/onborading_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8FA), // Match original background color
        body: BlocBuilder<OnboardingCubit, onboardingState> (
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
                  _buildHeader(context, cubit),

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
                  _buildBottomSection(context, cubit),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, OnboardingCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '  ', // Fixed to show page number
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          if (!cubit.isLastPage)
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: cubit.skipToLastPage,
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.grey[700],
                  size: 20.sp,
                ),
              ),
            )
          else
            SizedBox(width: 40.w),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, OnboardingCubit cubit) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              cubit.onboardingItems.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 4.h,
                width: cubit.currentIndex == index ? 24.w : 8.w,
                decoration: BoxDecoration(
                  color:
                      cubit.currentIndex == index
                          ? Color(0xFF6B7280)
                          : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed:
                  cubit.isCompleting
                      ? null
                      : (cubit.isLastPage
                          ? cubit.completeOnboarding
                          : cubit.nextPage),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6B7280),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                elevation: 0,
              ),
              child:
                  cubit.isCompleting
                      ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.w,
                        ),
                      )
                      : Text(
                        cubit.isLastPage ? 'Get Started' : 'Next',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageWidget extends StatefulWidget {
  final OnboardingModel model;
  final int pageIndex;

  const OnboardingPageWidget({
    super.key,
    required this.model,
    required this.pageIndex,
  });

  @override
  _OnboardingPageWidgetState createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color:
          widget
              .model
              .backgroundColor, // Uses Color(0xFFF7F8FA) from OnboardingModel
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: 280.w,
                  height: 350.h,
                  decoration: BoxDecoration(
                    color:
                        widget
                            .model
                            .backgroundColor, // Match OnboardingModel background
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20.r,
                        offset: Offset(0, 10.h),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      widget.model.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  widget.model.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    widget.model.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
