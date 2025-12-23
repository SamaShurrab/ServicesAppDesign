import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_dimenstions.dart';
import 'package:service_app_design/constant/app_strings.dart';


// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData suffixIconData;
  final TextInputType textInputType;
  bool isObscure;
  FormFieldValidator<String>? validator;
  final TextInputAction textInputAction;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.suffixIconData,
    required this.textInputType,
    required this.isObscure,
    this.validator,
    required this.textInputAction,
  });

  @override
  State<StatefulWidget> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.isObscure,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      cursorColor: AppColors.checkboxColorButtonText,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 12,
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontFamily: "Mulish",
        ),
        filled: true,

        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.transparent,
            onTap: () {
              widget.hintText == AppStrings.strongPasswordHint ||
                      widget.hintText == AppStrings.passwordHint
                  ? setState(() {
                      widget.isObscure = !widget.isObscure;
                    })
                  : widget.isObscure = false;
            },
            child: Icon(
              widget.isObscure && widget.hintText.contains("assword")
                  ? Icons.visibility_off_outlined
                  : widget.suffixIconData,
              color: AppColors.hintIconColor,
            ),
          ),
        ),
        fillColor: AppColors.textFieldBackground,
        hint: Text(
          widget.hintText,
          style: TextStyle(
            color: AppColors.hintIconColor,
            fontFamily: "Mulish",
            fontWeight: FontWeight.w400,
            fontSize: AppDimensions.hintSize,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusTextFormField,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: AppDimensions.widthBorderSideTextFormField,
            color: AppColors.checkboxColorButtonTextOp,
          ),
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusTextFormField,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: AppDimensions.widthBorderSideTextFormField,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusTextFormField,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: AppDimensions.widthBorderSideTextFormField,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusTextFormField,
          ),
        ),
      ),
    );
  }
}
