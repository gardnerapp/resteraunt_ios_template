class BaseAPI{
  static String base = "http://localhost:3000";
  static var api = base + "/api/v1/";
  var sectionsPath = api + "sections";
  var usersPath = api + "users";
  var sessionsPath = api + "sessions";
  var destroySessionPath = api + "sessions/destroy";
  var createOrderPath = api + "orders/create";
  var createCardPath = api + "cards";

  Map<String,String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
