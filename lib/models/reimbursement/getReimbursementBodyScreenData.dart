import 'dart:convert';

import 'getReimbursementMultiOccData.dart';
import 'getReimbursementSearchFieldAttr.dart';
import 'getReimbursementSearchFields.dart';

class ReimbScreenData {
  int recordsTotal;
  int recordsFiltered;
  List<ScreenFieldAttr> searchFields;
  List<ReimbMultiOccData> multiOccData;
  String userid;
  String username;
  bool hideSearchPanel;

  ReimbScreenData(
      this.recordsTotal,
      this.recordsFiltered,
      this.searchFields,
      this.multiOccData,
      this.userid,
      this.username,
      this.hideSearchPanel);

  ReimbScreenData.fromJson(Map<String, dynamic> json) {
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['searchFields'] != null) {
      searchFields = new List<ScreenFieldAttr>();
      json['searchFields'].forEach((v) {
        searchFields.add(new ScreenFieldAttr.fromJson(v));
      });
    }
    if (json['multiOccData'] != null) {
      multiOccData = new List<ReimbMultiOccData>();
      json['multiOccData'].forEach((v) {
        multiOccData.add(new ReimbMultiOccData.fromJson(v));
      });
    }
    userid = json['userid'];
    username = json['username'];
    hideSearchPanel = json['hideSearchPanel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordsTotal'] = this.recordsTotal;
    data['recordsFiltered'] = this.recordsFiltered;
    data['searchFields']= jsonEncode(this.searchFields);
    data['multiOccData']= jsonEncode(this.multiOccData);
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['hideSearchPanel'] = this.hideSearchPanel;
    return data;
  }

  @override
  String toString() {
    return 'ReimbScreenData{recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, searchFields: $searchFields, multiOccData: $multiOccData, userid: $userid, username: $username, hideSearchPanel: $hideSearchPanel}';
  }
}
