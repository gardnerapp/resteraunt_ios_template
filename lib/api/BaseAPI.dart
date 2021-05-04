class BaseAPI{
  static String base = "http://localhost:3000";
  static var api = base + "/api/v1";
  var loginPath = api + "/login";
  var userPath = api + "/user";
  var sectionsPath = api + "/sections";
  int accepted = 202;
  int unprocessed = 422;

  Map<String,String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}