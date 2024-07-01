import 'BaseConfig.dart';
import 'DevConfig.dart';
import 'ProdConfig.dart';
import 'StageConfig.dart';

class AppEnv {
  late final BaseConfig config;

  static final AppEnv _instance = AppEnv._internal();

  factory AppEnv() => _instance;

  AppEnv._internal();

  AppEnv init(Environment env) {
    config = _getConfig(env);
    return _instance; // Return the instance
  }

  BaseConfig _getConfig(Environment env) {
    switch (env) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.STAGE:
        return StageConfig();
      default:
        return DevConfig();
    }
  }

  static AppEnv get instance => _instance;
}

enum Environment { DEV, STAGE, PROD }
