part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> login(String email, String password,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + "login";

    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    User? value;

    try {
      value = User.fromJson(data['data']);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> registrasi(User user, String password,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'regis';

    var response = await client.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'city': user.city
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    User value = User.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> editProfile(User user,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'edit-profile/${user.id}';

    var response = await client.put(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'phone': user.phone,
          'city': user.city
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User value = User.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
