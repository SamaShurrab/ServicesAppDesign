import 'package:service_app_design/constant/app_strings.dart';
import 'package:service_app_design/constant/images_path.dart';

class Collections {
  static List<String> housesName = [
    AppStrings.addWorkers,
    "Tobi\nLateef",
    "Queen\nNeedle",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
    "Joan\nBlessing",
  ];

  static List services = [
    {
      "servicesName": AppStrings.electrical,
      "servicesImage": Paths.electricalImage,
      "servicesDescripton": AppStrings.description,
    },

    {
      "servicesName": AppStrings.carpenter,
      "servicesImage": Paths.carpenter,
      "servicesDescripton": AppStrings.description,
    },
    {
      "servicesName": AppStrings.plumber,
      "servicesImage": Paths.plumber,
      "servicesDescripton": AppStrings.description,
    },
    {
      "servicesName": AppStrings.others,
      "servicesImage": Paths.othersImage,
      "servicesDescripton": AppStrings.description,
    },
  ];
  static List feedbacks = [Paths.job1, Paths.job2];
}
