import 'env_secrete_config.dart';

enum Environment { development, production }

class EnvConfig {
  final Environment environment;
  final String apiBaseUrl;
  // final String baseUrl;
  final bool enableLogging;
  final bool enableDarkTheme;
  final bool isShrinkDownVersion;

  EnvConfig({
    required this.environment,
    required this.apiBaseUrl,
    // required this.baseUrl,
    required this.enableLogging,
    this.enableDarkTheme = false,

    /// If false then we need to uncomment real package from pubspec.yaml
    /// and also need to remove fake_image_picker.dart and faker_image_compressor.dart from stubs.dart
    /// and need to pub get image picker packages in pubspec.yaml
    this.isShrinkDownVersion = true,
  });

  factory EnvConfig.development() {
    return EnvConfig(
      environment: Environment.development,
      apiBaseUrl: EnvSecreteConfig.instance.apiBaseUrl,
      enableLogging: true,
    );
  }

  factory EnvConfig.production() {
    return EnvConfig(
      environment: Environment.production,
      apiBaseUrl: EnvSecreteConfig.instance.apiBaseUrl,
      enableLogging: true,
    );
  }

  static late EnvConfig _instance;

  static void initialize(Environment env) {
    switch (env) {
      case Environment.development:
        _instance = EnvConfig.development();
        break;
      case Environment.production:
        _instance = EnvConfig.production();
        break;
    }
  }

  static EnvConfig get instance => _instance;
}
