class MyModel {
  DataModel data;
  int code;
  String msg;

  MyModel({this.data, this.code, this.msg});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      code: json['code'],
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataModel {
  int count;
  List<DataListModel> list;

  DataModel({this.count, this.list});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      count: json['count'],
      list: json['list'] != null
          ? (json['list'] as List)
              .map((i) => DataListModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataListModel {
  int classType;
  String code;
  String curriculum_name;
  String curriculumid;
  String level;
  String starttime;
  String teacher_name;
  String totalscore;

  DataListModel(
      {this.classType,
      this.code,
      this.curriculum_name,
      this.curriculumid,
      this.level,
      this.starttime,
      this.teacher_name,
      this.totalscore});

  factory DataListModel.fromJson(Map<String, dynamic> json) {
    return DataListModel(
      classType: json['classType'],
      code: json['code'],
      curriculum_name: json['curriculum_name'],
      curriculumid: json['curriculumid'],
      level: json['level'],
      starttime: json['starttime'],
      teacher_name: json['teacher_name'],
      totalscore: json['totalscore'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classType'] = this.classType;
    data['code'] = this.code;
    data['curriculum_name'] = this.curriculum_name;
    data['curriculumid'] = this.curriculumid;
    data['level'] = this.level;
    data['starttime'] = this.starttime;
    data['teacher_name'] = this.teacher_name;
    data['totalscore'] = this.totalscore;
    return data;
  }
}
