import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_strings.dart';

class CustomSectionName extends StatelessWidget {
  final String sectionName;
  final void Function()? onTap;
  const CustomSectionName({super.key, required this.sectionName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        InkWell(
          splashColor: Colors.grey,
          onTap: onTap,
          child: Text(
            AppStrings.all,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
