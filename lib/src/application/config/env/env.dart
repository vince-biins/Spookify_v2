import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env/development.env')
abstract class Env {
  @EnviedField(varName: 'SPOTIFY_BASE_URL')
  static const String spotifyBaseUrl = _Env.spotifyBaseUrl;

  @EnviedField(varName: 'NAME')
  static const String name = _Env.name;

  @EnviedField(varName: 'GRANT_TYPE')
  static const String grantType = _Env.grantType;

  @EnviedField(varName: 'CLIENT_ID')
  static const String clientId = _Env.clientId;

  @EnviedField(varName: 'CLIENT_SECRET')
  static const String clientSecret = _Env.clientSecret;

  @EnviedField(varName: 'CONTENT_TYPE')
  static const String contentType = _Env.contentType;
}
