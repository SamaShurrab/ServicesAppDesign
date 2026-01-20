import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/custom%20widget/custom_card.dart';

class CustomSectionServices extends StatelessWidget {
  final List servicesNameList;
  final int index;
  const CustomSectionServices({
    super.key,
    required this.servicesNameList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: 356,
      height: 93,
      cardColor: Colors.white,
      widget: Center(
        child: ListTile(
          leading: Image.asset(
            servicesNameList[index]["servicesImage"],
            height: 70,
            width: 70,
            fit: BoxFit.contain,
          ),
          title: Text(
            servicesNameList[index]["servicesName"],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              servicesNameList[index]["servicesDescripton"],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: -0.43,
                color: AppColors.descriptionTextColor,
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
