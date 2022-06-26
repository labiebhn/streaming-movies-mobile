import 'package:flutter_dotenv/flutter_dotenv.dart';

class CONFIGS {
  static String API_BASE_URL = dotenv.env['API_BASE_URL'] ?? '';
  static int API_CONNECT_TIMEOUT = 20000;
  static int API_RECEIVE_TIMEOUT = 20000;
}
