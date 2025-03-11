import 'package:dio/dio.dart';
import 'package:mobiliz/core/constants/app_constants.dart';
import 'package:mobiliz/core/models/base_response_model.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();

  final Dio dio = Dio(
    BaseOptions(baseUrl: AppConstants.baseUrl),
  );

  Future<BaseResponseModel<T>> sendRequest<T>(
      String endpoint, T Function(dynamic) fromJsonT) async {
    try {
      final response = await dio.get(
        endpoint,
      );
      return BaseResponseModel<T>.fromJson(response.data, fromJsonT);
    } catch (e) {
      return BaseResponseModel<T>(
        status: false,
      );
    }
  }
}
