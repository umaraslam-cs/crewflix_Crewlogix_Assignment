import 'package:crewflix/App/Movies/Model/movies_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../Network/api_client.dart';
import '../../../Utils/toast_message.dart';

mixin MoviesService {
  Future<List<MoviesModel>> getMoviesService() async {
    List<MoviesModel> data = [];

    var response;
    response = await ApiClient(Dio()).getRequest(
      apiUrl: "https://showtimes.everyday.in.th/api/v2/movie/",
    );
    debugPrint('🚀🚀🚀${response.data}');

    if (response.statusCode == 200 ) {
      data = MoviesModel.jsonToList(response.data["results"]);
    } else {
      ShowMessage().onFail(response.data["errors"].join("").toString());
    }
    return data;
  }
}
