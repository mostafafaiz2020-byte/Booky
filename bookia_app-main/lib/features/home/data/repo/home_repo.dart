import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/data/model/books_model.dart';

import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/networking/dio_factory.dart';
import '../model/books_model.dart';
// import 'package:dio/dio.dart';

class HomeRepo {
  // static Dio dio = Dio();
  static getBestSellerBooks() async {
    try {
      final Response = await DioFactory.dio?.get(
        ApiEndpoints.productsBestseller,
      );
      if (Response?.statusCode == 200) {
        BooksModel books = BooksModel.fromJson(Response?.data);
        return books;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
