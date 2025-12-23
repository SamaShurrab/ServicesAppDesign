import 'package:flutter/material.dart';
import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/collections.dart';
import 'package:service_app_design/custom%20widget/custom_section_houses.dart';
import 'package:service_app_design/custom%20widget/custom_section_services.dart';

class ViewAllPage extends StatelessWidget {
  final String sectionName;
  const ViewAllPage({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          sectionName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 5),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: sectionName == AppStrings.houses
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 170,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: Collections.housesName.length,
                itemBuilder: (context, index) {
                  return CustomSectionHouses(
                    housesNameList: Collections.housesName,
                    index: index,
                  );
                },
              )
            : ListView.builder(
                itemCount: Collections.services.length,
                itemBuilder: (context, index) {
                  return CustomSectionServices(
                    servicesNameList: Collections.services,
                    index: index,
                  );
                },
              ),
      ),
    );
  }
}
