import 'package:crewflix/App/Movies/View/book_ticket_view.dart';
import 'package:crewflix/App/Movies/View/movies_detail_view.dart';
import 'package:crewflix/App/Movies/View/movies_list_view.dart';
import 'package:crewflix/App/Movies/ViewModel/movies_view_model.dart';
import 'package:get/get.dart';
import '../App/Movies/View/video_player_view.dart';
import '../App/Splash/View/splash_view.dart';
import '../App/Splash/ViewModel/splash_view_model.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashView,
      transition: Transition.rightToLeft,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashViewModel>(
          () => SplashViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.moviesListView,
      transition: Transition.rightToLeft,
      page: () => MoviesListView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MoviesVM>(
          () => MoviesVM(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.moviesDetailView,
      transition: Transition.rightToLeft,
      page: () => MoviesDetailView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.moviesDetailView,
      transition: Transition.rightToLeft,
      page: () => MoviesDetailView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.videoPlayerView,
      transition: Transition.rightToLeft,
      page: () => const VideoPlayerView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.bookTicketView,
      transition: Transition.rightToLeft,
      page: () => const BookTicketView(),
      binding: BindingsBuilder(() {}),
    ),
  ];
}
