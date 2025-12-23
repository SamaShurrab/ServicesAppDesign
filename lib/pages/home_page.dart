import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_colors.dart';
import 'package:service_app_design/constant/app_dimenstions.dart';
import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/collections.dart';
import 'package:service_app_design/constant/images_path.dart';
import 'package:service_app_design/custom%20widget/custom_card.dart';
import 'package:service_app_design/custom%20widget/custom_section_houses.dart';
import 'package:service_app_design/custom%20widget/custom_section_name.dart';
import 'package:service_app_design/custom%20widget/custom_section_services.dart';
import 'package:service_app_design/pages/view_all_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppStrings.appBarTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          InkWell(child: Image.asset(Paths.munu, height: 20, width: 20)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              top: 400,
              child: Container(
                width: 200,
                height: double.infinity,
                decoration: BoxDecoration(color: AppColors.secondaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 69,
                        height: 82.72,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(50, 60),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: ClipOval(
                            child: Image.asset(
                              width: 55,
                              height: 65.94,
                              Paths.userImagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.userName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            AppStrings.jobTitle,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomCard(
                          height: AppDimensions.heightCardInformation,
                          width: AppDimensions.widthCardInformation,
                          cardColor: AppColors.secondaryColor,
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.walletBalance,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                AppStrings.walletBalanceNumber,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                AppStrings.totalService,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                AppStrings.totalServiceNumber,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomCard(
                          height: AppDimensions.heightCardInformation,
                          width: AppDimensions.widthCardInformation,
                          cardColor: AppColors.primaryColor,
                          widget: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    AppStrings.masterCard,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  AppStrings.masterCardNumber,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppStrings.masterCardName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.heightBetweenSections),
                  CustomSectionName(
                    sectionName: AppStrings.houses,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewAllPage(sectionName: AppStrings.houses);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: AppDimensions.heightBetweenSectionsAndContents,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimensions.heightCardInformation,
                    child: ListView.builder(
                      itemCount: Collections.housesName.length,
                      itemBuilder: (context, index) {
                        return CustomSectionHouses(
                          housesNameList: Collections.housesName,
                          index: index,
                        );
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: AppDimensions.heightBetweenSections),
                  CustomSectionName(
                    sectionName: AppStrings.services,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewAllPage(
                              sectionName: AppStrings.services,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: AppDimensions.heightBetweenSectionsAndContents,
                  ),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomSectionServices(
                        servicesNameList: Collections.services,
                        index: index,
                      );
                    },
                  ),
                  SizedBox(height: AppDimensions.heightBetweenSections),
                  CustomSectionName(sectionName: AppStrings.feedbacks),
                  SizedBox(
                    height: AppDimensions.heightBetweenSectionsAndContents,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.centerRight,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              child: CustomCard(
                                cardColor: Colors.grey,
                                widget: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.borderRadiusCustomCard,
                                  ),
                                  child: Image.asset(
                                    Collections.feedbacks[index],
                                    width: 120,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            CustomCard(
                              width: 280,
                              height: 90,
                              cardColor: Colors.white,
                              widget: Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      Paths.userImagePath,
                                      width: 50,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    AppStrings.feedback1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
