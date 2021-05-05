class BibleResponse {
  List<Data> data;

  var url;

  BibleResponse({this.data});

  BibleResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String book;
  String chapter;
  String fileName;
  String filePath;
  String readCount;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.book,
      this.chapter,
      this.fileName,
      this.filePath,
      this.readCount,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    book = json['book'];
    chapter = json['chapter'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    readCount = json['read_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['book'] = this.book;
    data['chapter'] = this.chapter;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    data['read_count'] = this.readCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
