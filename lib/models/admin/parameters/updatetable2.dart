class UpdateParamsTable {
  String itempfx;
  String itemcoy;
  String itemcoy1;
  String itemtabl;
  String itemitem;
  String itemseq;
  String language;
  String validflag;
  String longdesc;
  String shortdesc;
  String itmfrm;
  String itmto;

  UpdateParamsTable(
      {this.itempfx,
        this.itemcoy,
        this.itemtabl,
        this.itemitem,
        this.itemseq,
        this.language,
        this.itemcoy1,
        this.validflag,
        this.longdesc,
        this.shortdesc,
        this.itmfrm,
        this.itmto});

  UpdateParamsTable.fromJson(Map<String, dynamic> json) {
    itempfx = json['itempfx'];
    itemcoy = json['itemcoy'];
    itemcoy1=json['itemcoy1'];
    itemtabl = json['itemtabl'];
    itemitem = json['itemitem'];
    itemseq = json['itemseq'];
    language = json['language'];
    validflag = json['validflag'];
    longdesc = json['longdesc'];
    shortdesc = json['shortdesc'];
    itmfrm = json['itmfrm'];
    itmto = json['itmto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itempfx'] = this.itempfx;
    data['itemcoy'] = this.itemcoy;
    data['itemtabl'] = this.itemtabl;
    data['itemitem'] = this.itemitem;
    data['itemseq'] = this.itemseq;
    data['language'] = this.language;
    data['validflag'] = this.validflag;
    data['longdesc'] = this.longdesc;
    data['shortdesc'] = this.shortdesc;
    data['itmfrm'] = this.itmfrm;
    data['itmto'] = this.itmto;
    data['itemcoy1']=this.itemcoy1;
    return data;
  }
}