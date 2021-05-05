import 'package:biblepod/model/bible_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BibleApi {
  static Future<List<Bible>> getBibleLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/photos.json');
    final body = json.decode(data);

    return body.map<Bible>(Bible.fromJson).toList();
  }
}
