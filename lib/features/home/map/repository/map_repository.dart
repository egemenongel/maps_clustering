import 'package:mobiliz/core/models/base_response_model.dart';
import 'package:mobiliz/core/models/location_model.dart';
import 'package:mobiliz/core/network/dio_client.dart';

class MapRepository {
  static final MapRepository _instance = MapRepository._();

  MapRepository._();

  factory MapRepository() => _instance;

  Future<BaseResponseModel<List<LocationModel>>> getLocations({
    int? skip,
  }) async {
    final queries = {'fields': 'lat,lon,town'};
    if (skip != null) {
      queries['skip'] = skip.toString();
    }
    return await DioClient().getRequest(
      'towns',
      (data) => (data as List).map((e) => LocationModel.fromJson(e)).toList(),
      queryParameters: queries,
    );
  }
}
