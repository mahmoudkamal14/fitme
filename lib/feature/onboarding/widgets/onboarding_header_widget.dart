import 'package:fitme/feature/onboarding/logic/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  const OnboardingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
}
