import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isBigSize;
  final bool isLoading;

  const CustomElevatedBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.isBigSize = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isBigSize ? 52 : 44,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white, // loader white
          ),
        )
            : Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
