import 'dart:convert';

import 'package:fit_timesheets/models/multiOccData.dart';
import 'package:fit_timesheets/models/screenFieldAttr.dart';
import 'package:fit_timesheets/models/timesheetData.dart';


class CloneScreenData {
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields = List<SearchFields>();
  List<MultiOccData> multiOccData = List<MultiOccData>();
  List<TimeSheetData> timesheetData = List<TimeSheetData>();

  List<String> dates=List<String>();
  String enddate;
  String statusdesc;
 String status;
 int footerData;
 bool previousExist;
 bool nextExist;
  String optionalSwitches;
  String nextScreen;
  String screenFieldAttr;
  String headerFieldAttribute;
  String  cloneFromDate;
  String cloneToDate;
  List<String> cloneDates;



  CloneScreenData(
      this.recordsTotal,
      this.recordsFiltered,
      this.searchFields,
      this.multiOccData,
      this.dates,
      this.enddate,
      this.statusdesc,
      this.status,
      this.footerData,
      this.previousExist,
      this.nextExist,
      this.optionalSwitches,
      this.nextScreen,
      this.screenFieldAttr,
      this.headerFieldAttribute,
      this.cloneFromDate,
      this.cloneToDate,
      this.cloneDates,
      this.timesheetData);

  CloneScreenData.fromJson(Map<String, dynamic> json) {
    recordsTotal= json["recordsTotal"];
    recordsFiltered= json["recordsFiltered"];
    if (json['searchFields'] != null) {
      searchFields = new List<SearchFields>();
      json['searchFields'].forEach((v) {
        searchFields.add(new SearchFields.fromJson(v));
      });
    }
    if (json['multiOccData'] != null) {
      multiOccData = new List<MultiOccData>();
    json['multiOccData'].forEach((v) {
      multiOccData.add(new MultiOccData.fromJson(v));
    });
    }
    enddate= json["enddate"];
    statusdesc= json["statusdesc"];
    status= json["status"];
    footerData=json['footerData'];
    previousExist= json["previousExist"];
    nextExist= json["nextExist"];
    optionalSwitches = json['optionalSwitches'];
    nextScreen= json["nextScreen"];
    screenFieldAttr= json["screenFieldAttr"];
    headerFieldAttribute = json['headerFieldAttribute'];

    cloneFromDate = json['cloneFromDate'];
    cloneToDate = json['cloneToDate'];
    cloneDates = json['cloneDates'].cast<String>();
    if (json['timesheetData'] != null) {
      timesheetData = new List<TimeSheetData>();
      json['timesheetData'].forEach((v) {
        timesheetData.add(new TimeSheetData.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    return {
      "recordsTotal": this.recordsTotal,
      "recordsFiltered": this.recordsFiltered,
      "searchFields": jsonEncode(this.searchFields),
      "multiOccData": jsonEncode(this.multiOccData),
      "dates": jsonEncode(this.dates),
      "enddate": this.enddate,
      "statusdesc": this.statusdesc,
      "footerData":this.footerData,
      "status": this.status,
      "previousExist": this.previousExist,
      "nextExist": this.nextExist,
      "optionalSwitches": this.optionalSwitches,
      "nextScreen": this.nextScreen,
      "screenFieldAttr": this.screenFieldAttr,
      "headerFieldAttribute": this.headerFieldAttribute,
    "cloneFromDate" : this.cloneFromDate,
    "cloneToDate": this.cloneToDate,
    "cloneDates" : this.cloneDates,
      "timesheetData": jsonEncode(this.timesheetData),
    };
  }

  @override
  String toString() {
    return 'ScreenData{recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, searchFields: $searchFields, multiOccData: $multiOccData, timesheetData: $timesheetData, dates: $dates, enddate: $enddate, statusdesc: $statusdesc, status: $status, footerData: $footerData, previousExist: $previousExist, nextExist: $nextExist, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, screenFieldAttr: $screenFieldAttr, headerFieldAttribute: $headerFieldAttribute, cloneFromDate: $cloneFromDate, cloneToDate: $cloneToDate, cloneDates: $cloneDates}';
  }

//

}
