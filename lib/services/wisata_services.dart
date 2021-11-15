part of 'services.dart';

class WisataServices {
  static Future<ApiReturnValue<List<Wisata>>> getWisata(User user,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + "wisata";

    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    List<Wisata> listWisata =
        (data['data'] as Iterable).map((e) => Wisata.fromJsonSqlServer(e)).toList();

    return ApiReturnValue(value: listWisata.where((element) => (user.city == "Makassar")
            ? element.city == "Makassar"
            : (user.city == "Tulungagung")
                ? element.city == "Tulungagung"
                : (user.city == "Banyumas")
                    ? element.city == "Banyumas"
                    : false)
        .toList());
  }
}
