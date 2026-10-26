import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    required this.controller,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && isObscureText,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      validator: widget.validator,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(Icons.visibility),
              )
            : null,
        hintStyle: AppTextStyles.hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.borderSideColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.borderSideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
