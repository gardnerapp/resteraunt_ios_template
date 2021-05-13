class BaseAPI{
  static String base = "http://localhost:3000";
  static var api = base + "/api/v1";
  var sectionsPath = api + "/sections";
  var usersPath = api + "/users";
  var sessionsPath = api + "/sessions";
  var destroySessionPath = api + "/sessions/destroy";

  Map<String,String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}

//TODO test logoout, create reset password, store data locally route login to home
// show menu if no user route to login