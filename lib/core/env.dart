// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

enum _Environment {
  Stage,
  Production,
}
const _env = _Environment.Stage;

class Env {
  static init() async {
    /* String? envPath;
    switch (_env) {
      case _Environment.Stage:
        envPath = Assets.env.stageEnv;
        break;
      case _Environment.Production:
        envPath = Assets.env.prodEnv;
        break;
    } */

    //await DotEnv.dotenv.load(fileName: envPath);
    await DotEnv.dotenv.load(fileName: 'assets/env/.dev_env');
  }

  static String get envName {
    return DotEnv.dotenv.env['ENVIRONMENT_NAME'] ?? 'unset';
  }

  static String get storagePrefix {
    return DotEnv.dotenv.env['STORAGE_PREFIX'] ?? 'unset';
  }

  static String get apiBaseUrl {
    return DotEnv.dotenv.env['API_BASE_URL'] ?? 'https://domain.com/api';
  }

  static bool get debug {
    return DotEnv.dotenv.env['DEBUG'] == "true";
  }

  static String get debugLoginEmail {
    if (!debug) return "";
    return DotEnv.dotenv.env['DEBUG_LOGIN_EMAIL'] ?? "";
  }

  static String get debugLoginPassword {
    if (!debug) return "";
    return DotEnv.dotenv.env['DEBUG_LOGIN_PASSWORD'] ?? "";
  }
}
