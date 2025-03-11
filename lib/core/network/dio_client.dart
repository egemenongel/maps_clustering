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

  Future<BaseResponseModel<T>> getRequest<T>(
    String endpoint,
    T Function(dynamic) fromJsonT, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return BaseResponseModel<T>.fromJson(response.data, fromJsonT);
    } catch (e) {
      return BaseResponseModel<T>(
        status: false,
      );
    }
  }
}
