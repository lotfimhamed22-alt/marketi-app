import 'package:marketi/core/constants/assets_constants.dart';
import 'package:marketi/features/onboarding/data/model/onboarding_model.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    text: "Welcome to Marketi",
    body:
        "Discover a world of endless\npossibilities and shop from\nthe comfort of your fingertips\nBrowse through a wide range\nof products, from fashion\nand electronics to home.",
    imageUrl: AssetsConstants.onboardingImageOne,
  ),
  //
  OnboardingModel(
    text: "Easy to Buy",
    body:
        "Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.",
    imageUrl: AssetsConstants.onboardingImageTwo,
  ),
  //
  OnboardingModel(
    text: "Wonderful User Experience",
    body:
        "\t\t\tStart exploring now and experience the\n\t\tconvenience of online shopping at its best.",
    imageUrl: AssetsConstants.onboardingImageThree,
  ),
];
