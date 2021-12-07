class Status{
  int id;
  String name;

  Status({this.name,this.id});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(id: json["id"], name: json["name"],);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }

  @override
  String toString() {
    return 'Status{id: $id, name: $name}';
  }
}