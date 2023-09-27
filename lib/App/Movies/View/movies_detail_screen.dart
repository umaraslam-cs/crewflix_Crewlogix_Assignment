// SizedBox(
//       height: 300,
//       child: CarouselSlider.builder(
//         unlimitedMode: true,
//         controller: _sliderController,
//         slideBuilder: (index) {
//           return CacheImageView(
//               image: adsVM.adDetailData.value.images[index].filePath);
//         },
//         slideTransform: const DefaultTransform(),
//         slideIndicator: CircularSlideIndicator(
//           padding: const EdgeInsets.only(bottom: 32),
//           indicatorRadius: 6,
//           indicatorBackgroundColor: AppColor.white,
//           currentIndicatorColor: AppColor.primaryColor,
//           indicatorBorderColor: Colors.transparent,
//         ),
//         itemCount: adsVM.adDetailData.value.images.length,
//         initialPage: 0,
//         enableAutoSlider: false,
//       ),
//     ),

import 'package:crewflix/Utils/Constant/AppConfig.dart';
import 'package:crewflix/Utils/cache_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Utils/AppText/AppTextView.dart';
import '../../../Utils/Theme/colors.dart';
import '../Model/movies_model.dart';
import '../ViewModel/movies_view_model.dart';

class MoviesDetailView extends StatelessWidget {
  MoviesDetailView({Key? key}) : super(key: key);
  final moviesVM = Get.find<MoviesVM>();
  final MoviesModel moviesData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: AppConfig(context).width / 1.5,
                  child: CarouselSlider.builder(
                    unlimitedMode: true,
                    controller: moviesVM.sliderController,
                    slideBuilder: (index) {
                      return CacheImageView(
                          image: moviesData.images[index].url);
                    },
                    slideTransform: const DefaultTransform(),
                    slideIndicator: CircularSlideIndicator(
                      padding: const EdgeInsets.only(bottom: 32),
                      indicatorRadius: 4,
                      indicatorBackgroundColor: AppColor.white,
                      currentIndicatorColor: AppColor.primaryColor,
                      indicatorBorderColor: Colors.transparent,
                    ),
                    itemCount: moviesData.images.length,
                    initialPage: 0,
                    enableAutoSlider: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColor.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    title: moviesData.title,
                    size: 18,
                    fontWeight: FontWeights.semiBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    splashFactory: NoSplash.splashFactory,
                    child: Ink(
                      height: AppConfig(context).width / 9,
                      width: AppConfig(context).width,
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: const Center(
                        child: CustomText(
                          title: "Watch Trailer",
                          size: 16,
                          fontWeight: FontWeights.semiBold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    title: "Date",
                    size: 16,
                    fontWeight: FontWeights.semiBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    title: DateFormat("dd MMMM yyyy")
                        .format(moviesData.releaseDate),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(
                    title: "Overview",
                    size: 16,
                    fontWeight: FontWeights.semiBold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(title: moviesData.details.first.storyline),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
