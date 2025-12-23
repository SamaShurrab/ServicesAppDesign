import 'package:flutter/material.dart';

import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/images_path.dart';
import 'package:service_app_design/custom%20widget/circular_widget.dart';
import 'package:service_app_design/custom%20widget/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.beginColorGradient, AppColors.endColorGradient],
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularWidget(
              height: 100,
              width: 100,
              widget: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(Paths.userImagePath),
              ),
            ),
            SizedBox(height: 50),
            Text(
              AppStrings.welcomeStatement,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              AppStrings.splashdescription,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50),
            CustomButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, "register");
              },
              child: Text(
                AppStrings.getStartedBtn,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
