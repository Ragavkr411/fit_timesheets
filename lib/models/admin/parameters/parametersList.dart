class ParametersList {
  String status;
  Body body;

  ParametersList({this.status, this.body});

  ParametersList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  List<DataUpdate> data;
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  Null headerObject;

  Body(
      {this.data,
        this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.headerObject});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataUpdate>();
      json['data'].forEach((v) {
        data.add(new DataUpdate.fromJson(v));
      });
    }
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['searchFields'] != null) {
      searchFields = new List<SearchFields>();
      json['searchFields'].forEach((v) {
        searchFields.add(new SearchFields.fromJson(v));
      });
    }
    headerObject = json['headerObject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['recordsTotal'] = this.recordsTotal;
    data['recordsFiltered'] = this.recordsFiltered;
    if (this.searchFields != null) {
      data['searchFields'] = this.searchFields.map((v) => v.toJson()).toList();
    }
    data['headerObject'] = this.headerObject;
    return data;
  }
}

class DataUpdate {
  String itempfx;
  String itemcoy;
  String itemtabl;
  String itemitem;
  String itemseq;
  String itmfrm;
  String itmto;
  String tranid;
  String tableprog;
  String validflag;
  String genarea;
  String userProfile;
  String jobName;
  String createdDatime;
  String updatedDatime;
  String language;
  String shortdesc;
  String longdesc;
  int totalMultiItems;

  DataUpdate(
      {this.itempfx,
        this.itemcoy,
        this.itemtabl,
        this.itemitem,
        this.itemseq,
        this.itmfrm,
        this.itmto,
        this.tranid,
        this.tableprog,
        this.validflag,
        this.genarea,
        this.userProfile,
        this.jobName,
        this.createdDatime,
        this.updatedDatime,
        this.language,
        this.shortdesc,
        this.longdesc,
        this.totalMultiItems});

  DataUpdate.fromJson(Map<String, dynamic> json) {
    itempfx = json['itempfx'];
    itemcoy = json['itemcoy'];
    itemtabl = json['itemtabl'];
    itemitem = json['itemitem'];
    itemseq = json['itemseq'];
    itmfrm = json['itmfrm'];
    itmto = json['itmto'];
    tranid = json['tranid'];
    tableprog = json['tableprog'];
    validflag = json['validflag'];
    genarea = json['genarea'];
    userProfile = json['user_profile'];
    jobName = json['job_name'];
    createdDatime = json['createdDatime'];
    updatedDatime = json['updatedDatime'];
    language = json['language'];
    shortdesc = json['shortdesc'];
    longdesc = json['longdesc'];
    totalMultiItems = json['totalMultiItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itempfx'] = this.itempfx;
    data['itemcoy'] = this.itemcoy;
    data['itemtabl'] = this.itemtabl;
    data['itemitem'] = this.itemitem;
    data['itemseq'] = this.itemseq;
    data['itmfrm'] = this.itmfrm;
    data['itmto'] = this.itmto;
    data['tranid'] = this.tranid;
    data['tableprog'] = this.tableprog;
    data['validflag'] = this.validflag;
    data['genarea'] = this.genarea;
    data['user_profile'] = this.userProfile;
    data['job_name'] = this.jobName;
    data['createdDatime'] = this.createdDatime;
    data['updatedDatime'] = this.updatedDatime;
    data['language'] = this.language;
    data['shortdesc'] = this.shortdesc;
    data['longdesc'] = this.longdesc;
    data['totalMultiItems'] = this.totalMultiItems;
    return data;
  }
}
class Genarea {
  String paramGroup;
  String paramType;
  String productCode;
  String minItemLength;
  int maxItemLength;
  List<String> contExtraDataScreen;

  Genarea(
      {this.paramGroup,
        this.paramType,
        this.productCode,
        this.minItemLength,
        this.maxItemLength,
        this.contExtraDataScreen});

  Genarea.fromJson(Map<String, dynamic> json) {
    paramGroup = json['paramGroup'];
    paramType = json['paramType'];
    productCode = json['productCode'];
    minItemLength = json['minItemLength'];
    maxItemLength = json['maxItemLength'];
    contExtraDataScreen = json['contExtraDataScreen'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paramGroup'] = this.paramGroup;
    data['paramType'] = this.paramType;
    data['productCode'] = this.productCode;
    data['minItemLength'] = this.minItemLength;
    data['maxItemLength'] = this.maxItemLength;
    data['contExtraDataScreen'] = this.contExtraDataScreen;
    return data;
  }
}
class SearchFields {
  String displayName;
  String fieldName;

  SearchFields({this.displayName, this.fieldName});

  SearchFields.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    fieldName = json['fieldName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['fieldName'] = this.fieldName;
    return data;
  }
}