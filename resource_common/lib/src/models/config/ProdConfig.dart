import 'BaseConfig.dart';

class ProdConfig implements BaseConfig {
  // String get serverUrl => "14.29.213.197";
  @override
  String get serverHost => "chat.veryrealai.com";
  @override
  String get serverVersion => "v1.3";
}
