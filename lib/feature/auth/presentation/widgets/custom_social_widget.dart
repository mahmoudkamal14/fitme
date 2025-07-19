import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialWidget extends StatelessWidget {
  const CustomSocialWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  final String imagePath;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: const Color(0x0C9F9E9A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            SvgPicture.asset(imagePath),
            Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
