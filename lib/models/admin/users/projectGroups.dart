class ProjectGroups {
  String status;
  Body body;

  ProjectGroups({this.status, this.body});

  ProjectGroups.fromJson(Map<String, dynamic> json) {
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
  String screenName;
  ScreenData screenData;
  Null optionalSwitches;
  Null nextScreen;
  ScreenFieldAttr screenFieldAttr;
  Null headerFieldAttribute;

  Body(
      {this.screenName,
        this.screenData,
        this.optionalSwitches,
        this.nextScreen,
        this.screenFieldAttr,
        this.headerFieldAttribute});

  Body.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    screenData = json['screenData'] != null
        ? new ScreenData.fromJson(json['screenData'])
        : null;
    optionalSwitches = json['optionalSwitches'];
    nextScreen = json['nextScreen'];
    screenFieldAttr = json['screenFieldAttr'] != null
        ? new ScreenFieldAttr.fromJson(json['screenFieldAttr'])
        : null;
    headerFieldAttribute = json['headerFieldAttribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenName'] = this.screenName;
    if (this.screenData != null) {
      data['screenData'] = this.screenData.toJson();
    }
    data['optionalSwitches'] = this.optionalSwitches;
    data['nextScreen'] = this.nextScreen;
    if (this.screenFieldAttr != null) {
      data['screenFieldAttr'] = this.screenFieldAttr.toJson();
    }
    data['headerFieldAttribute'] = this.headerFieldAttribute;
    return data;
  }
}

class ScreenData {
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  List<MultiOccData> multiOccData;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.multiOccData});

  ScreenData.fromJson(Map<String, dynamic> json) {
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordsTotal'] = this.recordsTotal;
    data['recordsFiltered'] = this.recordsFiltered;
    if (this.searchFields != null) {
      data['searchFields'] = this.searchFields.map((v) => v.toJson()).toList();
    }
    if (this.multiOccData != null) {
      data['multiOccData'] = this.multiOccData.map((v) => v.toJson()).toList();
    }
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

class MultiOccData {
  int id;
  String name;
  Null userid;
  List<Null> actions;

  MultiOccData({this.id, this.name, this.userid, this.actions});

  MultiOccData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userid = json['userid'];
    // if (json['actions'] != null) {
    //   actions = new List<Null>();
    //   json['actions'].forEach((v) {
    //     actions.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userid'] = this.userid;
    // if (this.actions != null) {
    //   data['actions'] = this.actions.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ScreenFieldAttr {
  Name name;
  Id id;
  Name userid;
  Name actions;

  ScreenFieldAttr({this.name, this.id, this.userid, this.actions});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    userid = json['userid'] != null ? new Name.fromJson(json['userid']) : null;
    actions =
    json['actions'] != null ? new Name.fromJson(json['actions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.userid != null) {
      data['userid'] = this.userid.toJson();
    }
    if (this.actions != null) {
      data['actions'] = this.actions.toJson();
    }
    return data;
  }
}

class Name {
  bool isFormfield;
  bool isDisabled;

  Name({this.isFormfield, this.isDisabled});

  Name.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}

class Id {
  bool isFormfield;
  bool isDisabled;
  String promptScreen;
  String promptParams;
  ReturnFieldMap returnFieldMap;

  Id(
      {this.isFormfield,
        this.isDisabled,
        this.promptScreen,
        this.promptParams,
        this.returnFieldMap});

  Id.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    isDisabled = json['isDisabled'];
    promptScreen = json['promptScreen'];
    promptParams = json['promptParams'];
    returnFieldMap = json['returnFieldMap'] != null
        ? new ReturnFieldMap.fromJson(json['returnFieldMap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['isDisabled'] = this.isDisabled;
    data['promptScreen'] = this.promptScreen;
    data['promptParams'] = this.promptParams;
    if (this.returnFieldMap != null) {
      data['returnFieldMap'] = this.returnFieldMap.toJson();
    }
    return data;
  }
}

class ReturnFieldMap {
  String name;
  String id;

  ReturnFieldMap({this.name, this.id});

  ReturnFieldMap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}