import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/token_response.dart';

part 'token_service.g.dart';

@RestApi()
abstract class TokenService {
  factory TokenService(Dio dio, {String baseUrl}) = _TokenService;

  @POST('/api/token')
  @FormUrlEncoded()
  Future<TokenResponse> getToken(
    @Field('grant_type') String grantType,
    @Field('client_id') String clientId,
    @Field('client_secret') String clientSecret,
  );
}
