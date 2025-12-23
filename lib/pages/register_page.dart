import 'package:flutter/material.dart';

import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_dimenstions.dart';
import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/images_path.dart';
import 'package:service_app_design/custom%20widget/custom_button.dart';
import 'package:service_app_design/custom%20widget/custom_checkbox.dart';
import 'package:service_app_design/custom%20widget/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
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
                  AppStrings.getStarted,
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  AppStrings.registerDescription,
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
                        hintText: AppStrings.userNameHint,
                        suffixIconData: Icons.person_outline_rounded,
                        textInputType: TextInputType.name,
                        validator: (userName) {
                          if (userName!.isEmpty) {
                            return AppStrings.emptyError;
                          }
                          if (userName.length < 3) {
                            return AppStrings.invalidUserName;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppDimensions.heightBetweenTextField),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        isObscure: false,
                        hintText: AppStrings.emailHint,
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
                        textInputAction: TextInputAction.next,
                        isObscure: false,
                        hintText: AppStrings.phoneNumberHint,
                        suffixIconData: Icons.phone_android_outlined,
                        textInputType: TextInputType.phone,
                        validator: (phone) {
                          if (phone!.isEmpty) return AppStrings.emptyError;
                          if (!phone.contains("+")) {
                            return AppStrings.invalidPhoneMessage2;
                          }
                          if (phone.length != 13) {
                            return AppStrings.invalidPhoneMessage1;
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: AppDimensions.heightBetweenTextField),
                      CustomTextField(
                        textInputAction: TextInputAction.done,
                        isObscure: true,
                        hintText: AppStrings.strongPasswordHint,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCheckbox(),
                          RichText(
                            text: TextSpan(
                              text: AppStrings.termsAndConditions.substring(
                                0,
                                37,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w400,
                                fontSize: 9.9,
                              ),
                              children: [
                                TextSpan(
                                  text: AppStrings.termsAndConditions.substring(
                                    37,
                                    42,
                                  ),
                                  style: TextStyle(
                                    color: AppColors.checkboxColorButtonText,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                TextSpan(
                                  text: AppStrings.termsAndConditions.substring(
                                    42,
                                    47,
                                  ),
                                ),
                                TextSpan(
                                  text: AppStrings.termsAndConditions.substring(
                                    47,
                                    AppStrings.termsAndConditions.length,
                                  ),
                                  style: TextStyle(
                                    color: AppColors.checkboxColorButtonText,
                                  ),
                                ),
                              ],
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
                            Navigator.of(context).pushReplacementNamed("login");
                          } else if (!CustomCheckboxState.isChecked == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  AppStrings.checkBoxError,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                backgroundColor: Colors.red,

                                margin: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            );
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
                      AppStrings.alreadyAMember,
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
                        Navigator.of(context).pushNamed("login");
                      },
                      child: Text(
                        AppStrings.loginIn,
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
