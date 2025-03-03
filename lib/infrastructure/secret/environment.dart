final class Environment {
  static const baseUrl = String.fromEnvironment('SPOTIFY_BASE_URL');
  static const token = String.fromEnvironment('TOKEN');

  static const grantType = String.fromEnvironment('GRANT_TYPE');
  static const clientId = String.fromEnvironment('CLIENT_ID');
  static const clientSecret = String.fromEnvironment('CLIENT_SECRET');
  static const contentType = String.fromEnvironment('CONTENT_TYPE');
}
