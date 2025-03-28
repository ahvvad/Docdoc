import 'package:dio/dio.dart';
import 'package:docdoc/Core/networking/api_constants.dart';
import 'package:docdoc/Features/login/data/models/login_request_body.dart';
import 'package:docdoc/Features/login/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) => _ApiService as ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
