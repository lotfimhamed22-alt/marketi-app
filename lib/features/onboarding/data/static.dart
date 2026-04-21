import 'package:marketi/core/constants/imageurl/image_assets.dart';
import 'package:marketi/features/onboarding/data/model/onboarding_model.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    text: "Welcome to Marketi",
    body:
        "Discover a world of endless\npossibilities and shop from\nthe comfort of your fingertips\nBrowse through a wide range\nof products, from fashion\nand electronics to home.",
    imageUrl: ImageAssets.onboardingImageOne,
  ),
  //
  OnboardingModel(
    text: "Easy to Buy",
    body:
        "Find the perfect item that suits your style and \nneeds With secure payment options and fast \ndelivery, shopping has never been easier.",
    imageUrl: ImageAssets.onboardingImageTwo,
  ),
  //
  OnboardingModel(
    text: "Wonderful User Experience",
    body:
        "\t\t\tStart exploring now and experience the\n\t\tconvenience of online shopping at its best.",
    imageUrl: ImageAssets.onboardingImageThree,
  ),
];
