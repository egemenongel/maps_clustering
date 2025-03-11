import 'package:mobiliz/core/models/base_response_model.dart';
import 'package:mobiliz/core/models/location_model.dart';
import 'package:mobiliz/core/network/dio_client.dart';

class MapRepository {
  static final MapRepository _instance = MapRepository._();

  MapRepository._();

  factory MapRepository() => _instance;

  Future<BaseResponseModel<List<LocationModel>>> getLocations() async {
    return await DioClient().sendRequest(
      'towns?fields=lat,lon,town',
      (data) => (data as List).map((e) => LocationModel.fromJson(e)).toList(),
    );
  }
}
