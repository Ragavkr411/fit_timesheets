class Autogenerated {
  String status;
  Body body;

  Autogenerated({this.status, this.body});

  Autogenerated.fromJson(Map<String, dynamic> json) {
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
  List<Data> data;
  int recordsTotal;
  int recordsFiltered;
  List<SearchFields> searchFields;
  String headerObject;

  Body(
      {this.data,
        this.recordsTotal,
        this.recordsFiltered,
        this.searchFields,
        this.headerObject});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  String itemitem;
  String description;

  Data({this.itemitem, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    itemitem = json['itemitem'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemitem'] = this.itemitem;
    data['description'] = this.description;
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