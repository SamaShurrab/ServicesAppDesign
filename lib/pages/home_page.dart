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
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [
          InkWell(child: Image.asset(Paths.munu, height: 20, width: 20)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // User Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 69,
                  height: 82.72,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.elliptical(50, 60)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: ClipOval(
                      child: Image.asset(
                        Paths.userImagePath,
                        width: 55,
                        height: 65.94,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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

            const SizedBox(height: 20),

            // Cards Wallet + MasterCard
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
                        const Text(
                          AppStrings.walletBalance,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          AppStrings.walletBalanceNumber,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          AppStrings.totalService,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
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
                const SizedBox(width: 20),
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
                        children: const [
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
                          SizedBox(height: 10),
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

            // Houses Section
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
            SizedBox(height: AppDimensions.heightBetweenSectionsAndContents),
            SizedBox(
              width: double.infinity,
              height: AppDimensions.heightCardInformation,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Collections.housesName.length,
                itemBuilder: (context, index) {
                  return CustomSectionHouses(
                    housesNameList: Collections.housesName,
                    index: index,
                  );
                },
              ),
            ),

            SizedBox(height: AppDimensions.heightBetweenSections),

            // Services Section
            CustomSectionName(
              sectionName: AppStrings.services,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewAllPage(sectionName: AppStrings.services);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: AppDimensions.heightBetweenSectionsAndContents),
            Column(
              children: List.generate(2, (index) {
                return CustomSectionServices(
                  servicesNameList: Collections.services,
                  index: index,
                );
              }),
            ),

            SizedBox(height: AppDimensions.heightBetweenSections),
            // Feedbacks Section
            CustomSectionName(sectionName: AppStrings.feedbacks),
            SizedBox(height: AppDimensions.heightBetweenSectionsAndContents),
            Column(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(
                              Collections.feedbacks[index],
                              width: MediaQuery.sizeOf(context).width * .32,
                              height: MediaQuery.sizeOf(context).height * .1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: -5,
                          child: CustomCard(
                            width: MediaQuery.sizeOf(context).width * .65,
                            height: MediaQuery.sizeOf(context).height * .11,
                            cardColor: Colors.white,
                            widget: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      Paths.userImagePath,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      AppStrings.feedback1,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
