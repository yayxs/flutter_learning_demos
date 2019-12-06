class Demojson {
  String msg;
  int code;
  List<DataListBean> data;

  Demojson({this.msg, this.code, this.data});

  Demojson.fromJson(Map<String, dynamic> json) {
    this.msg = json['msg'];
    this.code = json['code'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataListBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class DataListBean {
  String date;
  List<ListListBean> list;

  DataListBean({this.date, this.list});

  DataListBean.fromJson(Map<String, dynamic> json) {
    this.date = json['date'];
    this.list = (json['list'] as List) != null
        ? (json['list'] as List).map((i) => ListListBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['list'] =
        this.list != null ? this.list.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ListListBean {
  String url;

  ListListBean({this.url});

  ListListBean.fromJson(Map<String, dynamic> json) {
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
