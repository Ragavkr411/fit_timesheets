import 'activityId.dart';
import 'manHours.dart';

class ScreenFieldAttribute{
  Detail0 detail0;
  Detail0 manHours0;
  Detail0 manHours3;
  Detail0 manHours4;
  Detail0 manHours1;
  Detail0 manHours2;
  Activityid activityid;
  Detail0 manHours5;
  Detail0 manHours6;
  Detail0 detail1;
  Detail0 detail2;
  Detail0 detail3;
  Detail0 detail4;
  Detail0 activitydesc;
  Detail0 detail5;
  Detail0 detail6;

  ScreenFieldAttribute(
      {this.detail0,
        this.manHours0,
        this.manHours3,
        this.manHours4,
        this.manHours1,
        this.manHours2,
        this.activityid,
        this.manHours5,
        this.manHours6,
        this.detail1,
        this.detail2,
        this.detail3,
        this.detail4,
        this.activitydesc,
        this.detail5,
        this.detail6});

  ScreenFieldAttribute.fromJson(Map<String, dynamic> json) {
    detail0 =
    json['detail0'] != null ? new Detail0.fromJson(json['detail0']) : null;
    manHours0 = json['manHours0'] != null
        ? new Detail0.fromJson(json['manHours0'])
        : null;
    manHours3 = json['manHours3'] != null
        ? new Detail0.fromJson(json['manHours3'])
        : null;
    manHours4 = json['manHours4'] != null
        ? new Detail0.fromJson(json['manHours4'])
        : null;
    manHours1 = json['manHours1'] != null
        ? new Detail0.fromJson(json['manHours1'])
        : null;
    manHours2 = json['manHours2'] != null
        ? new Detail0.fromJson(json['manHours2'])
        : null;
    activityid = json['activityid'] != null
        ? new Activityid.fromJson(json['activityid'])
        : null;
    manHours5 = json['manHours5'] != null
        ? new Detail0.fromJson(json['manHours5'])
        : null;
    manHours6 = json['manHours6'] != null
        ? new Detail0.fromJson(json['manHours6'])
        : null;
    detail1 =
    json['detail1'] != null ? new Detail0.fromJson(json['detail1']) : null;
    detail2 =
    json['detail2'] != null ? new Detail0.fromJson(json['detail2']) : null;
    detail3 =
    json['detail3'] != null ? new Detail0.fromJson(json['detail3']) : null;
    detail4 =
    json['detail4'] != null ? new Detail0.fromJson(json['detail4']) : null;
    activitydesc = json['activitydesc'] != null
        ? new Detail0.fromJson(json['activitydesc'])
        : null;
    detail5 =
    json['detail5'] != null ? new Detail0.fromJson(json['detail5']) : null;
    detail6 =
    json['detail6'] != null ? new Detail0.fromJson(json['detail6']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail0 != null) {
      data['detail0'] = this.detail0.toJson();
    }
    if (this.manHours0 != null) {
      data['manHours0'] = this.manHours0.toJson();
    }
    if (this.manHours3 != null) {
      data['manHours3'] = this.manHours3.toJson();
    }
    if (this.manHours4 != null) {
      data['manHours4'] = this.manHours4.toJson();
    }
    if (this.manHours1 != null) {
      data['manHours1'] = this.manHours1.toJson();
    }
    if (this.manHours2 != null) {
      data['manHours2'] = this.manHours2.toJson();
    }
    if (this.activityid != null) {
      data['activityid'] = this.activityid.toJson();
    }
    if (this.manHours5 != null) {
      data['manHours5'] = this.manHours5.toJson();
    }
    if (this.manHours6 != null) {
      data['manHours6'] = this.manHours6.toJson();
    }
    if (this.detail1 != null) {
      data['detail1'] = this.detail1.toJson();
    }
    if (this.detail2 != null) {
      data['detail2'] = this.detail2.toJson();
    }
    if (this.detail3 != null) {
      data['detail3'] = this.detail3.toJson();
    }
    if (this.detail4 != null) {
      data['detail4'] = this.detail4.toJson();
    }
    if (this.activitydesc != null) {
      data['activitydesc'] = this.activitydesc.toJson();
    }
    if (this.detail5 != null) {
      data['detail5'] = this.detail5.toJson();
    }
    if (this.detail6 != null) {
      data['detail6'] = this.detail6.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ScreenFieldAttribute{detail0: $detail0, manHours0: $manHours0, manHours3: $manHours3, manHours4: $manHours4, manHours1: $manHours1, manHours2: $manHours2, activityid: $activityid, manHours5: $manHours5, manHours6: $manHours6, detail1: $detail1, detail2: $detail2, detail3: $detail3, detail4: $detail4, activitydesc: $activitydesc, detail5: $detail5, detail6: $detail6}';
  }
}

