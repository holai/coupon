class Config {
  static bool Islocal = false;
  static bool IsDebug = true;

  static String getBaseUrl() {
    if (Islocal) {
      return 'http://192.168.0.106:3000';
    } else {
      return '';
    }
  }
}
// /api/admin/login
