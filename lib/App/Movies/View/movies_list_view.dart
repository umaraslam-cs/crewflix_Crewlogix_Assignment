import 'package:crewflix/RoutesAndBindings/app_routes.dart';
import 'package:crewflix/Utils/AppText/AppTextView.dart';
import 'package:crewflix/Utils/Constant/AppConfig.dart';
import 'package:crewflix/Utils/cache_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Utils/Theme/colors.dart';
import '../ViewModel/movies_view_model.dart';

class MoviesListView extends StatelessWidget {
  MoviesListView({Key? key}) : super(key: key);
  final moviesVM = Get.find<MoviesVM>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CrewFlix',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => moviesVM.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: AppColor.primaryColor,
                        size: 22,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      itemCount: moviesVM.moviesData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.moviesDetailView,
                              arguments: moviesVM.moviesData[index]),
                          child: Row(
                            children: [
                              CacheImageView(
                                  height: AppConfig(context).width / 4,
                                  width: AppConfig(context).width / 5,
                                  circlularPadding: 0,
                                  boxfit: BoxFit.fill,
                                  image: moviesVM
                                      .moviesData[index].images.first.url),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      title: moviesVM.moviesData[index].title,
                                      txtOverFlow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      title: DateFormat("dd MMMM yyyy").format(
                                          moviesVM
                                              .moviesData[index].releaseDate),
                                    ),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              //outlined book button
                              OutlinedButton(
                                onPressed: () =>
                                    Get.toNamed(AppRoutes.bookTicketView),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: AppColor.black,
                                  backgroundColor: AppColor.white,
                                ),
                                child: const Text('Book'),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
            )),
      ),
    );
  }
}
