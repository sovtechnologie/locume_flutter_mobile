class CONFIG {
  bool debug = true;
  String uatUrl = "https://19u1szcoq1.execute-api.ap-south-1.amazonaws.com";
  String prodUrl = "";
  static String apiUrl() {
    return CONFIG().debug ? CONFIG().uatUrl : CONFIG().prodUrl;
  }
}
