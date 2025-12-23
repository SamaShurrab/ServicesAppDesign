import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_dimenstions.dart';
import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/images_path.dart';
import 'package:service_app_design/custom%20widget/custom_button.dart';
import 'package:service_app_design/custom%20widget/custom_checkbox.dart';
import 'package:service_app_design/custom%20widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(Paths.signinUpImage, height: 280),
                Text(
                  AppStrings.loginTitle,
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  AppStrings.loginDescription,
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        isObscure: false,
                        hintText: AppStrings.enterYourEmail,
                        suffixIconData: Icons.email_outlined,
                        textInputType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) return AppStrings.emptyError;

                          if (!email.contains("@")) {
                            return AppStrings.invalidEmailMessage1;
                          }

                          if (!email.contains(".com")) {
                            return AppStrings.invalidEmailMessage2;
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: AppDimensions.heightBetweenTextField),
                      CustomTextField(
                        textInputAction: TextInputAction.done,
                        isObscure: true,
                        hintText: AppStrings.passwordHint,
                        suffixIconData: Icons.visibility_outlined,
                        textInputType: TextInputType.text,
                        validator: (password) {
                          if (password!.isEmpty) return AppStrings.emptyError;

                          if (!RegExp(AppStrings.pattern).hasMatch(password)) {
                            return AppStrings.invalidPasswordMessage;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppDimensions.heightBetweenTextField),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomCheckbox(),
                              Text(
                                AppStrings.rememberMe,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                          InkWell(
                            onTap: () {},
                            child: Text(
                              AppStrings.forgotPassword,
                              style: TextStyle(
                                color: AppColors.checkboxColorButtonText,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      CustomButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.checkboxColorButtonText,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.nextButtonText,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            formKey.currentState!.reset();
                            Navigator.of(context).pushReplacementNamed("home");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.newMember,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("register");
                      },
                      child: Text(
                        AppStrings.registerNow,
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 13,
                          color: AppColors.checkboxColorButtonText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
