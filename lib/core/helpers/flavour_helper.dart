import 'package:ticket_mobile/core/enums/enviroment_enum.dart';
import 'package:ticket_mobile/core/utils/constants.dart';

class Flavour {
  static late Enviroment enviroment;

  static String getBaseUrl() => switch (enviroment) {
        Enviroment.prod => Constants.prodBaseUrl,
        _ => Constants.devBaseUrl
      };

  static bool isDev() => enviroment == Enviroment.dev;
  static bool isProd() => enviroment == Enviroment.prod;
}
