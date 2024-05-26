import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static final String apiUrl = dotenv.get("API_URL");
  static final String apiKey = dotenv.get("API_KEY");
  static final String webClientId = dotenv.get("WEB_CLIENT_ID");
  static final String androidClientId = dotenv.get("ANDROID_CLIENT_ID");
}
