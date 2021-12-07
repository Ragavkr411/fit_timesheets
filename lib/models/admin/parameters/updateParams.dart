class UpdateParams {
  String itempfx;
  String itemcoy;
  String itemtabl;
  String language;
  String validflag;
  String longdesc;
  String tableprog;
  String genarea;

  UpdateParams(
      {this.itempfx,
        this.itemcoy,
        this.itemtabl,
        this.language,
        this.validflag,
        this.longdesc,
        this.tableprog,
        this.genarea});

  UpdateParams.fromJson(Map<String, dynamic> json) {
    itempfx = json['itempfx'];
    itemcoy = json['itemcoy'];
    itemtabl = json['itemtabl'];
    language = json['language'];
    validflag = json['validflag'];
    longdesc = json['longdesc'];
    tableprog = json['tableprog'];
    genarea = json['genarea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itempfx'] = this.itempfx;
    data['itemcoy'] = this.itemcoy;
    data['itemtabl'] = this.itemtabl;
    data['language'] = this.language;
    data['validflag'] = this.validflag;
    data['longdesc'] = this.longdesc;
    data['tableprog'] = this.tableprog;
    data['genarea'] = this.genarea;
    return data;
  }
}