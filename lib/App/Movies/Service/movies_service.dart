import 'package:crewflix/App/Movies/Model/movies_model.dart';
import 'package:crewflix/Network/api_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../DB/hive_helper.dart';
import '../../../Network/api_client.dart';
import '../../../Utils/toast_message.dart';

mixin MoviesService {
  Future<List<MoviesModel>> getMoviesService() async {
    List<MoviesModel> data = [];

    var response;
    response = await ApiClient(Dio()).getRequest(
      apiUrl: ApiUrl.moviesUrl,
    );
    debugPrint('🚀🚀🚀${response.data}');

    if (response.statusCode == 200) {
      data = MoviesModel.jsonToList(response.data["results"]);
       if (await HiveService().isExists(boxName: "movies")) {
        print("data already exist in db");
        await HiveService().deleteBox("movies");
        await HiveService()
            .addBoxes<MoviesModel>(data, "movies");
      } else {
        print("data not exist");
        await HiveService()
            .addBoxes<MoviesModel>(data, "movies");
      }
    } else {
      ShowMessage().onFail(response.data["errors"].join("").toString());
    }
    return data;
  }
}
