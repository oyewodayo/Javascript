import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bible {
  final int id;
  final String book;
  final int chapter;
  final String fileName;
  final String filePath;
  final String readCount;

  const Bible({
    @required this.id,
    @required this.book,
    @required this.chapter,
    @required this.fileName,
    @required this.filePath,
    @required this.readCount,
  });

  static Bible fromJson(json) => Bible(
      id: json['id'],
      book: json['book'],
      chapter: json['chapter'],
      fileName: json['fileName'],
      filePath: json['filePath'],
      readCount: json['readCount']);
}
