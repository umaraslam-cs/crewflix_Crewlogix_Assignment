part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future getRequest({required String apiUrl}) async {
    var response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        'accept': '*/*',
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((onError) {
      if (onError is DioError) {
        ShowMessage().onFail("No internet connection!");
      }

      debugPrint("GET Error: ${onError.toString()}");
    });

    return response;
  }
}
