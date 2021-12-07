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