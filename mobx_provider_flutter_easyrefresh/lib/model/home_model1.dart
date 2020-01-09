class HomeModel {
  Data data;

  HomeModel({this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<DataX> data;
  int index;
  int size;
  int totalElements;

  Data({this.data, this.index, this.size, this.totalElements});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => DataX.fromJson(i)).toList()
          : null,
      index: json['index'],
      size: json['size'],
      totalElements: json['totalElements'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['size'] = this.size;
    data['totalElements'] = this.totalElements;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataX {
  String author;
  String bookImage;
  String content;
  String createdAt;
  bool delete;
  String description;
  int id;
  bool recommend;
  int score;
  String title;
  String updatedAt;
  int view;

  DataX(
      {this.author,
      this.bookImage,
      this.content,
      this.createdAt,
      this.delete,
      this.description,
      this.id,
      this.recommend,
      this.score,
      this.title,
      this.updatedAt,
      this.view});

  factory DataX.fromJson(Map<String, dynamic> json) {
    return DataX(
      author: json['author'],
      bookImage: json['bookImage'],
      content: json['content'],
      createdAt: json['createdAt'],
      delete: json['delete'],
      description: json['description'],
      id: json['id'],
      recommend: json['recommend'],
      score: json['score'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      view: json['view'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['bookImage'] = this.bookImage;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['delete'] = this.delete;
    data['description'] = this.description;
    data['id'] = this.id;
    data['recommend'] = this.recommend;
    data['score'] = this.score;
    data['title'] = this.title;
    data['updatedAt'] = this.updatedAt;
    data['view'] = this.view;
    return data;
  }
}
