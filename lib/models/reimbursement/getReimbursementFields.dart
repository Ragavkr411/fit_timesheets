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

class Image {
  bool isFormfield;
  String dataType;
  bool isDisabled;

  Image({this.isFormfield, this.dataType, this.isDisabled});

  Image.fromJson(Map<String, dynamic> json) {
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