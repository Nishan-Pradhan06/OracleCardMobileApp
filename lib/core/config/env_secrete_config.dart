import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvSecreteConfig {
  static final EnvSecreteConfig instance = EnvSecreteConfig._();
  EnvSecreteConfig._();

  String get apiBaseUrl {
    final String? key = dotenv.env['API_BASE_URL'];
    if (key == null) {
      throw 'API_BASE_URL not found';
    }
    return key;
  }

  String get homeIP {
    final String? key = dotenv.env['LUNAR_IP'];
    if (key == null) {
      throw 'HOME_IP not found';
    }
    return key;
  }
}
