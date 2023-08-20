import 'package:flutter/material.dart';
import 'package:photo_gallery_app/view/theme/app_colors.dart';
import 'package:photo_gallery_app/view/theme/font_styles.dart';

class ErrorOccurredWidget extends StatelessWidget {
  const ErrorOccurredWidget({
    Key? key,
    required this.reload,
    this.errorText,
    this.errorStyle,
  }) : super(key: key);

  final VoidCallback reload;
  final String? errorText;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText ?? "Something went wrong.",
            textAlign: TextAlign.center,
            style: errorStyle ??
                const TextStyle(
                  color: AppColors.black,
                  fontSize: CSizes.normal,
                  fontWeight: CWeights.normal,
                ),
          ),
          const SizedBox(
            height: CSizes.triplePadding,
          ),
          InkWell(
            onTap: reload,
            child: Container(
              padding: const EdgeInsets.all(CSizes.doublePadding),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Text(
                "Try again!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: CSizes.normal,
                  fontWeight: CWeights.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
