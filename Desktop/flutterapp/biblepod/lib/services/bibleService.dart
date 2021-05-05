import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:biblepod/model/bibleresponse.dart';

class BibleService {
  // ignore: missing_return
  Future<BibleResponse> getBible() async {
    try {
      http.Response response;
      response = await http
          .get(Uri.parse("https://www.biblepod.xyz/api/v1/bibles/ot"));

      if (response.statusCode == 200) {
        BibleResponse bibleResponse =
            BibleResponse.fromJson(json.decode(response.body));
        return bibleResponse;
      } else {
        return null;
      }
    } catch (e) {
      print('Caught error $e');
    }
  }
}
