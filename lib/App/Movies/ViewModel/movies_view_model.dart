import 'package:crewflix/App/Movies/Model/movies_model.dart';
import 'package:crewflix/App/Movies/Service/movies_service.dart';
import 'package:get/get.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../../DB/hive_helper.dart';

class MoviesVM extends GetxController with MoviesService {
  RxList<MoviesModel> moviesData = <MoviesModel>[].obs;
  RxBool isLoading = false.obs;
  CarouselSliderController? sliderController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onGetMovies();
    sliderController = CarouselSliderController();
  }

  Future onGetMovies() async {
    try {
      List<MoviesModel> dummyData = <MoviesModel>[];
      isLoading.value = true;
      if (await HiveService().isExists(boxName: "movies")) {
        dummyData = await HiveService().getBoxes<MoviesModel>("movies");
        moviesData.value = dummyData;
        moviesData.refresh();
        isLoading.value = false;
        await getMoviesService().then((value) => {
              if (value.isNotEmpty)
                {moviesData.value = value, moviesData.refresh()}
            });
      } else {
        dummyData = await getMoviesService();
        moviesData.value = dummyData;
        moviesData.refresh();
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}


// try {
//       List<MoviesModel> dummyData = <MoviesModel>[];
//       isLoading.value=true;
//       if (await HiveService().isExists(boxName: "movies")) {
//         dummyData =
//         await HiveService().getBoxes<MoviesModel>("movies");
//         moviesList.value =dummyData;
//         moviesList.refresh();
//         isLoading.value = false;
//         await getMoviesService()
//             .then((value) => {
//           if (value.isNotEmpty)
//             {moviesList.value = value, moviesList.refresh()}
//         });
//       } else {
//         dummyData= await getMoviesService();
//         moviesList.value =dummyData;
//         moviesList.refresh();
//         isLoading.value = false;
//       }

//     } catch (e) {
//       isLoading.value=false;
//       print(e);
//     }