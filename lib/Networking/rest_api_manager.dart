import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_app/Model/itunes_albums_model.dart';
import 'dart:async';

class RestApiManager {
  Future<Albums> fetchItunesAlbums() async {
    var url =
        "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json";
    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);

      final albums = albumsFromJson(response.body);

      print(albums);



      return albums;


    } else {
      print("Request failed with status: ${response.statusCode}.");

      return null;
    }
  }
}
