class CurriculumListModel {
  Data data;
  num code;
  String msg;

  CurriculumListModel({this.data, this.code, this.msg});

  factory CurriculumListModel.fromJson(Map<String, dynamic> json) {
    return CurriculumListModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
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

class Data {
  List<ResListDataModel> list;
  num total;

  Data({this.list, this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      list: json['list'] != null
          ? (json['list'] as List)
              .map((i) => ResListDataModel.fromJson(i))
              .toList()
          : null,
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResListDataModel {
  Curriculums curriculums;
  String date;

  ResListDataModel({this.curriculums, this.date});

  factory ResListDataModel.fromJson(Map<String, dynamic> json) {
    return ResListDataModel(
      curriculums: json['curriculums'] != null
          ? Curriculums.fromJson(json['curriculums'])
          : null,
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.curriculums != null) {
      data['curriculums'] = this.curriculums.toJson();
    }
    return data;
  }
}

class Curriculums {
  List<CurriculumsListModel> list;
  num total;

  Curriculums({this.list, this.total});

  factory Curriculums.fromJson(Map<String, dynamic> json) {
    return Curriculums(
      list: json['list'] != null
          ? (json['list'] as List)
              .map((i) => CurriculumsListModel.fromJson(i))
              .toList()
          : null,
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurriculumsListModel {
  String classType;
  String cname;
  String curriculumCode;
  String curriculumTime;
  String curriculumid;
  String date;
  String level;
  String reportFlag;
  num reviewScore;
  String reviewid;
  String schoolName;
  String subject;
  String teacherName;
  num userCount;
  num videoType;

  CurriculumsListModel(
      {this.classType,
      this.cname,
      this.curriculumCode,
      this.curriculumTime,
      this.curriculumid,
      this.date,
      this.level,
      this.reportFlag,
      this.reviewScore,
      this.reviewid,
      this.schoolName,
      this.subject,
      this.teacherName,
      this.userCount,
      this.videoType});

  factory CurriculumsListModel.fromJson(Map<String, dynamic> json) {
    return CurriculumsListModel(
      classType: json['classType'],
      cname: json['cname'],
      curriculumCode: json['curriculumCode'],
      curriculumTime: json['curriculumTime'],
      curriculumid: json['curriculumid'],
      date: json['date'],
      level: json['level'],
      reportFlag: json['reportFlag'],
      reviewScore: json['reviewScore'],
      reviewid: json['reviewid'],
      schoolName: json['schoolName'],
      subject: json['subject'],
      teacherName: json['teacherName'],
      userCount: json['userCount'],
      videoType: json['videoType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classType'] = this.classType;
    data['cname'] = this.cname;
    data['curriculumCode'] = this.curriculumCode;
    data['curriculumTime'] = this.curriculumTime;
    data['curriculumid'] = this.curriculumid;
    data['date'] = this.date;
    data['level'] = this.level;
    data['reportFlag'] = this.reportFlag;
    data['reviewScore'] = this.reviewScore;
    data['reviewid'] = this.reviewid;
    data['schoolName'] = this.schoolName;
    data['subject'] = this.subject;
    data['teacherName'] = this.teacherName;
    data['userCount'] = this.userCount;
    data['videoType'] = this.videoType;
    return data;
  }
}
