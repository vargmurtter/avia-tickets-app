import '../features/offers/models/offers_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('214a1713-bac0-4853-907c-a1dfc3cd05fd')
  Future<OffersModel> getOffers();
}