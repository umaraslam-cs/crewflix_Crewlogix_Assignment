import 'package:crewflix/App/Movies/Model/movies_model.dart';
import 'package:crewflix/App/Movies/Service/movies_service.dart';
import 'package:get/get.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

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
      isLoading.value = true;
      moviesData.value = await getMoviesService();
      print(moviesData.value.length);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
