import 'package:dio/dio.dart';
import 'package:free1/Screen/Home/Model/HomeModel.dart';

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  var dio = Dio();

  Future<HomeModel> insertStudent() async {
    String path =
        "https://praticle-service.s3.ap-south-1.amazonaws.com/api.json";
    var response = await dio.get(
      path,
    );

    HomeModel h1 = HomeModel.fromJson(response.data);

    return h1;
  }
}
