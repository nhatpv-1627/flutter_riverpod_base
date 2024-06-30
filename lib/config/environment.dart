import 'package:flutter_base/config/flavor_enum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Flavor get _flavor => Flavor.getByEnvironmentName(
      const String.fromEnvironment("environmentName"));

  static String get environmentFileName {
    switch (_flavor) {
      case Flavor.develop:
        return "assets/.env.develop";
      case Flavor.staging:
        return "assets/.env.staging";
      case Flavor.production:
        return "assets/.env.production";
    }
  }

  static String get appName => dotenv.get("APP_NAME");

  static String get baseUrl =>
      "${dotenv.get("API_ENDPOINT")}/${dotenv.get("API_VERSION")}";

  static String get apiKey => dotenv.get("API_KEY");

  static String get baseAssetLink => dotenv.get("BASE_ASSET_LINK");
}
