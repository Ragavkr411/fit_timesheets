class ModifyReimbursement {
  String status;
  Body body;

  ModifyReimbursement({this.status, this.body});

  ModifyReimbursement.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'ModifyReimbursement{status: $status, body: $body}';
  }
}

class Body {
  String screenName;
  ScreenData screenData;
  Null optionalSwitches;
  Null nextScreen;
  ScreenFieldAttr screenFieldAttr;
  HeaderFieldAttribute headerFieldAttribute;

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
    headerFieldAttribute = json['headerFieldAttribute'] != null
        ? new HeaderFieldAttribute.fromJson(json['headerFieldAttribute'])
        : null;
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
    if (this.headerFieldAttribute != null) {
      data['headerFieldAttribute'] = this.headerFieldAttribute.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Body{screenName: $screenName, screenData: $screenData, optionalSwitches: $optionalSwitches, nextScreen: $nextScreen, screenFieldAttr: $screenFieldAttr, headerFieldAttribute: $headerFieldAttribute}';
  }
}

class ScreenData {
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  List<MultiOccData> multiOccData;
  HeaderFieldMap headerFieldMap;
  Null hideAddRow;
  bool hideSearchPanel;
  FooterData footerData;

  ScreenData(
      {this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.multiOccData,
        this.headerFieldMap,
        this.hideAddRow,
        this.hideSearchPanel,
        this.footerData});

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
    headerFieldMap = json['headerFieldMap'] != null
        ? new HeaderFieldMap.fromJson(json['headerFieldMap'])
        : null;
    hideAddRow = json['hideAddRow'];
    hideSearchPanel = json['hideSearchPanel'];
    footerData = json['footerData'] != null
        ? new FooterData.fromJson(json['footerData'])
        : null;
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
    if (this.headerFieldMap != null) {
      data['headerFieldMap'] = this.headerFieldMap.toJson();
    }
    data['hideAddRow'] = this.hideAddRow;
    data['hideSearchPanel'] = this.hideSearchPanel;
    if (this.footerData != null) {
      data['footerData'] = this.footerData.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ScreenData{recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, searchFields: $searchFields, multiOccData: $multiOccData, headerFieldMap: $headerFieldMap, hideAddRow: $hideAddRow, hideSearchPanel: $hideSearchPanel, footerData: $footerData}';
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
  String rimbtypeid;
  String rimbtypedesc;
  String examount;
  bool inlineActionDisabled;
  Null image;
  bool proofDocumentExist;
  List<Null> actions;

  MultiOccData(
      {this.rimbtypeid,
        this.rimbtypedesc,
        this.examount,
        this.inlineActionDisabled,
        this.image,
        this.proofDocumentExist,
        this.actions});

  MultiOccData.fromJson(Map<String, dynamic> json) {
    rimbtypeid = json['rimbtypeid'];
    rimbtypedesc = json['rimbtypedesc'];
    examount = json['examount'];
    inlineActionDisabled = json['inlineActionDisabled'];
    image = json['image'];
    proofDocumentExist = json['proofDocumentExist'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rimbtypeid'] = this.rimbtypeid;
    data['rimbtypedesc'] = this.rimbtypedesc;
    data['examount'] = this.examount;
    data['inlineActionDisabled'] = this.inlineActionDisabled;
    data['image'] = this.image;
    data['proofDocumentExist'] = this.proofDocumentExist;
    return data;
  }

  @override
  String toString() {
    return 'MultiOccData{rimbtypeid: $rimbtypeid, rimbtypedesc: $rimbtypedesc, examount: $examount, inlineActionDisabled: $inlineActionDisabled, image: $image, proofDocumentExist: $proofDocumentExist, actions: $actions}';
  }
}

class HeaderFieldMap {
  String month;
  String year;
  String monthdesc;
  String userid;
  String status;

  HeaderFieldMap(
      {this.month, this.year, this.monthdesc, this.userid, this.status});

  HeaderFieldMap.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
    monthdesc = json['monthdesc'];
    userid = json['userid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    data['monthdesc'] = this.monthdesc;
    data['userid'] = this.userid;
    data['status'] = this.status;
    return data;
  }
}

class FooterData {
  String totalAmount;
  String totalItems;

  FooterData({this.totalAmount, this.totalItems});

  FooterData.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['totalItems'] = this.totalItems;
    return data;
  }
}

class ScreenFieldAttr {
  Rimbtypedesc rimbtypedesc;
  Images image;
  Rimbtypedesc proofDocumentExist;
  Rimbtypedesc examount;
  Rimbtypeid rimbtypeid;
  Rimbtypedesc actions;
  Rimbtypedesc inlineActionDisabled;

  ScreenFieldAttr(
      {this.rimbtypedesc,
        this.image,
        this.proofDocumentExist,
        this.examount,
        this.rimbtypeid,
        this.actions,
        this.inlineActionDisabled});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    rimbtypedesc = json['rimbtypedesc'] != null
        ? new Rimbtypedesc.fromJson(json['rimbtypedesc'])
        : null;
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
    proofDocumentExist = json['proofDocumentExist'] != null
        ? new Rimbtypedesc.fromJson(json['proofDocumentExist'])
        : null;
    examount = json['examount'] != null
        ? new Rimbtypedesc.fromJson(json['examount'])
        : null;
    rimbtypeid = json['rimbtypeid'] != null
        ? new Rimbtypeid.fromJson(json['rimbtypeid'])
        : null;
    actions = json['actions'] != null
        ? new Rimbtypedesc.fromJson(json['actions'])
        : null;
    inlineActionDisabled = json['inlineActionDisabled'] != null
        ? new Rimbtypedesc.fromJson(json['inlineActionDisabled'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rimbtypedesc != null) {
      data['rimbtypedesc'] = this.rimbtypedesc.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.proofDocumentExist != null) {
      data['proofDocumentExist'] = this.proofDocumentExist.toJson();
    }
    if (this.examount != null) {
      data['examount'] = this.examount.toJson();
    }
    if (this.rimbtypeid != null) {
      data['rimbtypeid'] = this.rimbtypeid.toJson();
    }
    if (this.actions != null) {
      data['actions'] = this.actions.toJson();
    }
    if (this.inlineActionDisabled != null) {
      data['inlineActionDisabled'] = this.inlineActionDisabled.toJson();
    }
    return data;
  }
}

class Rimbtypedesc {
  bool isFormfield;
  bool isDisabled;

  Rimbtypedesc({this.isFormfield, this.isDisabled});

  Rimbtypedesc.fromJson(Map<String, dynamic> json) {
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

class Images {
  bool isFormfield;
  String dataType;
  bool isDisabled;

  Images({this.isFormfield, this.dataType, this.isDisabled});

  Images.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    dataType = json['dataType'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['dataType'] = this.dataType;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}

class Rimbtypeid {
  bool isFormfield;
  String itemtabl;
  String itemcoy;
  String descType;
  String descField;
  bool isDisabled;

  Rimbtypeid(
      {this.isFormfield,
        this.itemtabl,
        this.itemcoy,
        this.descType,
        this.descField,
        this.isDisabled});

  Rimbtypeid.fromJson(Map<String, dynamic> json) {
    isFormfield = json['isFormfield'];
    itemtabl = json['itemtabl'];
    itemcoy = json['itemcoy'];
    descType = json['descType'];
    descField = json['descField'];
    isDisabled = json['isDisabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFormfield'] = this.isFormfield;
    data['itemtabl'] = this.itemtabl;
    data['itemcoy'] = this.itemcoy;
    data['descType'] = this.descType;
    data['descField'] = this.descField;
    data['isDisabled'] = this.isDisabled;
    return data;
  }
}

class HeaderFieldAttribute {
  bool enabled;
  Null screenFieldAttr;

  HeaderFieldAttribute({this.enabled, this.screenFieldAttr});

  HeaderFieldAttribute.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    screenFieldAttr = json['screenFieldAttr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['screenFieldAttr'] = this.screenFieldAttr;
    return data;
  }
}