import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<StatefulWidget> createState() {
    return CustomCheckboxState();
  }
}

class CustomCheckboxState extends State<CustomCheckbox> {
  static bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: BorderSide(color: AppColors.checkBoxBorderColor),
      activeColor: AppColors.checkboxColorButtonText,
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
  }
}
